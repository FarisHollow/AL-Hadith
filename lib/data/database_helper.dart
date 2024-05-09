import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';


class DatabaseHelper {
  late Database _database;

  Future<void> initializeDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'hadith_db.db');

    // Copy database file from assets to the documents directory
    ByteData data = await rootBundle.load('assets/hadith_db.db');
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes);

    _database = await openDatabase(path);
  }

  Future<List<Map<String, dynamic>>> query(String table) async {
    return _database.query(table);
  }
}
