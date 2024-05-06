import 'package:al_hadith/presentation/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sahih Bukhari',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',

      routes: {

        '/': (context) => const HomeScreen(),

      },
    );
  }
}

