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
  List<String> cardSubtitles = [
    'A summary of Sahih Bukhari Chapter 1',
    'Sahih Bukhari - The First Hadith',
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
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            index == 0
                                ? Text(
                              cardTitles[index],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                                : Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.blue,
                                      child: Icon(
                                        Icons.book,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sahih Bukhari",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Hadith: 1",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text("Sahih Hadith"),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                    PopupMenuButton(
                                      itemBuilder: (BuildContext context) {
                                        return <PopupMenuEntry>[
                                          PopupMenuItem(
                                            child: Text("Option 1"),
                                          ),
                                          PopupMenuItem(
                                            child: Text("Option 2"),
                                          ),
                                          PopupMenuItem(
                                            child: Text("Option 3"),
                                          ),
                                        ];
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(
                                  cardSubtitles[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
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
