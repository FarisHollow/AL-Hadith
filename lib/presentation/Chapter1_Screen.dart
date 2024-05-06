import 'package:al_hadith/presentation/widgets/cards.dart';
import 'package:flutter/material.dart';

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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        // Handle back button press
                      },
                      color: Colors.white, // White color for the icon
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sahih Bukhari",
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
                    Padding(
                      padding: EdgeInsets.all(8.0),
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
          ),
          // Clipping mechanism for circular second container
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
