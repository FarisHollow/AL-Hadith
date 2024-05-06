import 'package:al_hadith/presentation/Chapter1_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bukhari'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(7),
            child: ListTile(
              title: const Text("Chapter 1", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: const Text("Hadith range 1 - 7"),
              trailing: const Icon(Icons.arrow_forward_rounded),
              onTap: () {
                // Navigate to another screen when the tile is pressed
                Get.to(const Chapter1Screen());
              },
            ),
          ),

        ],
      ),
    );
  }
  }

