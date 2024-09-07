import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polaris_chief_mate/fun1/fun1_home.dart';
import 'package:polaris_chief_mate/fun2/fun2_home.dart';

class Fun extends StatefulWidget {
  const Fun({super.key});

  @override
  State<Fun> createState() => _FunState();
}

class _FunState extends State<Fun> {
  // List of image paths
  final List<String> imagePaths = [
    'images/fun1.jpeg',
    'images/fun2.jpg',
    'images/fun3.png', // Add more paths as needed
  ];

  // List of titles for each image
  final List<String> titles = [
    'Function 1',
    'Function 2',
    'Function 3', // Add more titles as needed
  ];

  // List of subtitles for each image
  final List<String> subtitles = [
    'Navigation',
    'Cargo Work',
    'Safety, Emergency & Ship Handling', // Add more subtitles as needed
  ];

  void _navigateToFun1(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Fun1()),
    );
  }

  void _navigateToFun2(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Fun2()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background for the whole screen
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            expandedHeight: 150.0,
            pinned: true,
            floating: true, // Makes the AppBar float and reappear when scrolling up
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Functions', // Header text
                style: GoogleFonts.fraunces(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 8.0,
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
              titlePadding: EdgeInsets.only(left: 50, bottom: 16), // Adjusted to align title slightly to the left
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // Navigate back
              },
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (ctx, i) {
                  return GestureDetector(
                    onTap: () {
                      if (i == 0) {
                        _navigateToFun1(context);
                      } else if (i == 1) {
                        _navigateToFun2(context);
                      }
                      // Add more navigation logic for other functions if needed
                    },
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(imagePaths[i]),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              blurRadius: 10.0,
                              offset: Offset(3, 3),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(16),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                titles[i],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 6.0,
                                      color: Colors.black.withOpacity(0.5),
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                subtitles[i],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 4.0,
                                      color: Colors.black.withOpacity(0.5),
                                      offset: Offset(1, 1),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: imagePaths.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
