import 'package:al_hadith/presentation/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:al_hadith/utils/db_utils.dart';


void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await DBUtils.initializeDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sahih Bukhari',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      initialRoute: '/',

      routes: {

        '/': (context) => const HomeScreen(),

      },
    );
  }
}

