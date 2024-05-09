import 'package:al_hadith/data/database_helper.dart';

class DBUtils {
  static DatabaseHelper _databaseHelper = DatabaseHelper();

  static Future<void> initializeDatabase() async {
    try {
      await _databaseHelper.initializeDatabase();
    } catch (e) {
      // Handle database initialization error
      print('Database initialization error: $e');
      throw e; // Rethrow the error to propagate it
    }
  }

  static Future<List<Map<String, dynamic>>> executeQuery(String table) async {
    try {
      return await _databaseHelper.query(table);
    } catch (e) {
      // Handle query execution error
      print('Query execution error: $e');
      throw e; // Rethrow the error to propagate it
    }
  }
}
