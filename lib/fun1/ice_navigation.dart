import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polaris_chief_mate/fun.dart';
import 'package:polaris_chief_mate/fun1/meterology.dart';
import 'package:polaris_chief_mate/fun1/ror.dart';

class IceNavigation extends StatefulWidget {
  const IceNavigation({super.key});

  @override
  State<IceNavigation> createState() => _IceNavigation();
}

class _IceNavigation extends State<IceNavigation> {
  // List of image paths
  final List<String> imagePaths = [
    'images/fun1/black.jpg',
    'images/fun1/black.jpg',
    'images/fun1/black.jpg',
    'images/fun1/black.jpg',
    'images/fun1/black.jpg',

    // Add more paths as needed
  ];

  // List of titles for each image
  final List<String> titles = [
    'Polar Code & PWOM',
    'Ice Navigation',
    'Equipments for Polar Water Navigation',
    'Precautions in Polar Areas',
    'Marpol Requirements for Polar Water',

    // Add more titles as needed
  ];

  // Function to navigate to specific screens
  void _navigateToDetails(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Ror()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Meterology()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Fun()),
        );
        break;
    // Add more cases as needed
    }
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
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Ice Navigation', // Header text
                style: GoogleFonts.playfairDisplay(
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
                textAlign: TextAlign.left,
              ),
              titlePadding: EdgeInsets.only(left: 45, bottom: 16), // Adjust left padding to align with the back arrow
              collapseMode: CollapseMode.parallax,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2.0,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                mainAxisExtent: 250,
              ),
              delegate: SliverChildBuilderDelegate(
                    (ctx, i) {
                  return GestureDetector(
                    onTap: () {
                      _navigateToDetails(context, i); // Navigate to the specific screen
                    },
                    child: Card(
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
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.6),
                              blurRadius: 9.0,
                              offset: Offset(0, 4), // Shadow offset
                            ),
                          ],
                        ),
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(16),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            titles[i], // Title for the card
                            style: GoogleFonts.playfairDisplay(
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
                        ),
                      ),
                    ),
                  );
                },
                childCount: imagePaths.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
