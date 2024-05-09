import 'package:flutter/material.dart';

import 'hexagon.dart';

class CustomBar extends StatelessWidget {
  final String title;
  final String subtitle;
  final int chapterNumber; // New property for chapter number

  CustomBar({required this.title, required this.subtitle, required this.chapterNumber});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Circular picture (you can replace with your own image widget)
            ClipPath(
              clipper: Hexagon(),
              child: Container(
                color: Colors.teal,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    chapterNumber.toString(), // Display chapter number
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16), // Space between image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 8), // Space between title and subtitle
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.teal,

                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


