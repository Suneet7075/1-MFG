import 'package:flutter/material.dart';

class Fun2 extends StatefulWidget {
  const Fun2({super.key});

  @override
  State<Fun2> createState() => _Fun2State();
}

class _Fun2State extends State<Fun2> {
  // List of image paths
  final List<String> imagePaths = [
    'images/fun1.jpeg',
    'images/fun2.jpg',
    'images/fun3.png', // Add more paths as needed
  ];

  // List of titles for each image
  final List<String> titles = [
    'Function 2',
    'Function 2',
    'Function 3', // Add more titles as needed
  ];

  // List of subtitles for each image
  final List<String> subtitles = [
    'Navigation',
    'Cargo Work',
    'Safety, Emergency & Ship Handling', // Add more subtitles as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background for the whole screen
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 25, top: 50), // Add top padding for margin
            child: Text(
              'Functions', // Header text
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 8.0,
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              itemCount: imagePaths.length, // Update item count based on the number of images
              itemBuilder: (ctx, i) {
                return Card(
                  color: Colors.transparent, // Transparent card background
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(imagePaths[i]), // Image for the card
                        fit: BoxFit.cover,
                      ),
                    ),
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            titles[i], // Title for the card
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 6.0,
                                  color: Colors.black.withOpacity(0.5),
                                  offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            subtitles[i], // Subtitle for the card
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                              shadows: [
                                Shadow(
                                  blurRadius: 4.0,
                                  color: Colors.black.withOpacity(0.5),
                                  offset: const Offset(1, 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2.0,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                mainAxisExtent: 250,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
