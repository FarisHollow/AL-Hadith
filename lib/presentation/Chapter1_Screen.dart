import 'package:al_hadith/presentation/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/db_utils.dart';

class Chapter1Screen extends StatefulWidget {
  const Chapter1Screen({Key? key}) : super(key: key);

  @override
  State<Chapter1Screen> createState() => _Chapter1ScreenState();
}

class _Chapter1ScreenState extends State<Chapter1Screen> {
  List<String> cardTitles = [
    'Chapter Summary',
    'Hadith: 1',
  ];
  List<Map<String, dynamic>> _chapterData = [];
  List<Map<String, dynamic>> _booksData = [];
  String _numHadith = '';
  String _bookTitle = '';
  String _subTitle = '';


  @override
  void initState() {
    super.initState();
    initializeDatabase();
  }

  Future<void> initializeDatabase() async {
    try {
      await DBUtils.initializeDatabase();
      await fetchChapterData();
      await fetchBooksData();
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

          _subTitle = _chapterData.first['title'].toString();



        }
      });
    } catch (e) {
      // Handle query execution error
      print('Error fetching chapter data: $e');
    }
  }

  Future<void> fetchBooksData() async {
    try {
      List<Map<String, dynamic>> booksData = await DBUtils.executeQuery('books');

      setState(() {
        _booksData = booksData;
        if (_booksData.isNotEmpty) {
          // Convert the retrieved value to a String before assigning it to _booksName
          _numHadith = _booksData.first['number_of_hadis'].toString();
          _bookTitle = _booksData.first['title'].toString();

          print('Number of hadiths: $_numHadith'); // Add this line for debugging
        }
      });
    } catch (e) {
      // Handle query execution error
      print('Error fetching books data: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Stack(
        children: [
          // Container for teal top bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100, // Adjust height as needed
              color: Colors.teal, // Teal color for the top bar
              child:  Row(
                children: [


                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 4),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Get.back();
                        // Handle back button press
                      },
                      color: Colors.white, // White color for the icon
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),


                      Text(
                        _bookTitle, // Display book name
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        _subTitle,

                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.0, left: 200),
                    child: Icon(
                      Icons.info,
                      color: Colors.white, // White color for the icon
                      size: 30,
                    ),
                  ),

                ],
              ),
            ),
          ),
          Positioned.fill(
            top: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                color: Colors.grey[300],
                child: ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: cardTitles.length,
                  itemBuilder: (context, index) {
                    return CustomCard(index: index,);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
