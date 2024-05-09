import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final int index;

  CustomCard({required this.index});

  List<String> cardSubtitles = [
    'A summary of Sahih Bukhari Chapter 1',
    'Sahih Bukhari - The First Hadith',
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            index == 0
                ? const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "1/1 Chapter: ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi i am faris and i am Mir Faris. I said it twice because i am beggineer and i need to learn flutter as fast as i can ",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
                : Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.book,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 16),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Colors.teal,
                      ),
                      child: const Text(
                        "Sahih Hadith",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuEntry>[
                          const PopupMenuItem(
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
  }
}
