import 'package:al_hadith/data/database_helper.dart';
import 'package:al_hadith/presentation/Chapter1_Screen.dart';
import 'package:al_hadith/presentation/widgets/bar.dart';
import 'package:al_hadith/presentation/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/db_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _chapterData = [];
  String _bookName = ''; // Variable to store book name


  @override
  void initState() {
    super.initState();
    initializeDatabase();
  }

  Future<void> initializeDatabase() async {
    try {
      await DBUtils.initializeDatabase();
      await fetchChapterData();
    } catch (e) {
      // Handle database initialization error
      print('Error initializing database: $e');
    }
  }

  Future<void> fetchChapterData() async {
    try {
      List<Map<String, dynamic>> chapterData = await DBUtils.executeQuery('chapter');
      setState(() {
        _chapterData = chapterData;
        if (_chapterData.isNotEmpty) {
          _bookName = _chapterData.first['chapter_id'];
        }
      });
    } catch (e) {
      // Handle query execution error
      print('Error fetching chapter data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100, // Adjust height as needed
              color: Colors.teal, // Teal color for the top bar
              child: const Row(
                children: [

                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),

                        Text(
                          'Sahih Bukhari', // Display book name
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "First Revelation Chapter",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),

          // Clipping mechanism for circular second container
          Positioned.fill(
            top: 100,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: GestureDetector(
                onTap: (){
                  Get.to(const Chapter1Screen());
                },
                child: Container(
                  color: Colors.grey[300],
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: _chapterData.length,
                    itemBuilder: (context, index) {
                      final chapter = _chapterData[index];
                      return CustomBar(
                        chapterNumber: chapter['number'],
                        title: chapter['title'],
                        subtitle: chapter['hadis_range'],
                        // Add more data as needed
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
