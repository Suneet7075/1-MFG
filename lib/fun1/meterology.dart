import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polaris_chief_mate/fun.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/ror.dart';

class Meterology extends StatefulWidget {
  const Meterology({super.key});

  @override
  State<Meterology> createState() => _Meterology();
}

class _Meterology extends State<Meterology> {
  // List of image paths
  final List<String> imagePaths = [
    'images/fun1/meteorology.jpg',
    'images/fun1/fronts.jpg',
    'images/fun1/currents.jpeg',
    'images/fun1/tides.png',
    'images/fun1/instruments.jpg',
    'images/fun1/black.jpg',

    // Add more paths as needed
  ];

  // List of titles for each image
  final List<String> titles = [
    'TRS',
    'TLD & Fronts',
    'Currents',
    'Tides',
    'Equipments',
    'Misc. Topics' // Add more titles as needed
  ];

  // Function to navigate to specific screens
  void _navigateToDetails(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Ror()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Fun()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Fun()),
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
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Marine Meteorology', // Header text
                style: GoogleFonts.playfairDisplay(
                  fontSize: 22,
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
              titlePadding: const EdgeInsets.only(left: 45, bottom: 16), // Adjust left padding to align with the back arrow
              collapseMode: CollapseMode.parallax,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                              offset: const Offset(0, 4), // Shadow offset
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(16),
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
                                  offset: const Offset(2, 2),
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
