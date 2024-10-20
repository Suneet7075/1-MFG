import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polaris_chief_mate/fun1/buoyage.dart';
import 'package:polaris_chief_mate/fun1/celestial_navigation.dart';
import 'package:polaris_chief_mate/fun1/chart_work.dart';
import 'package:polaris_chief_mate/fun1/electronic_navigation.dart';
import 'package:polaris_chief_mate/fun1/ice_navigation/ice_navigation.dart';
import 'package:polaris_chief_mate/fun1/meterology.dart';
import 'package:polaris_chief_mate/fun1/misc_topics1.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/ror.dart';
import 'package:polaris_chief_mate/home.dart';

class Fun1 extends StatefulWidget {
  const Fun1({super.key});

  @override
  State<Fun1> createState() => _Fun1State();
}

class _Fun1State extends State<Fun1> {
  // List of image paths
  final List<String> imagePaths = [
    'images/fun1/ror.jpg',
    'images/fun1/meteorology.jpg',
    'images/fun1/iala_buoyage.jpg',
    'images/fun1/chart_work.jpg',
    'images/fun1/celestialnavigation.jpg',
    'images/fun1/electronicnavigation.jpg',
    'images/fun1/ice_navigation.jpg',
    'images/fun1/misc_topics.jpeg'
    // Add more paths as needed
  ];

  // List of titles for each image
  final List<String> titles = [
    'ROR',
    'Marine Meteorology',
    'IALA Buoyage System',
    'Chart Work',
    'Celestial Navigation',
    'Electronic Navigation',
    'Polar Code & Ice Navigation',
    'Misc. Topics' // Add more titles as needed
  ];

  void _navigateToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }
  void _navigateToFun1(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Fun1()),
    );
  }


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
          MaterialPageRoute(builder: (context) => const Meterology()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Buoyage()),
        );
        break;

      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChartWork()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CelestialNavigation()),
        );
        break;

      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ElectronicNavigation()),
        );
        break;

      case 6:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => IceNavigation()),
        );
        break;

      case 7:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MiscTopics1()),
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
              icon: const Icon(Icons.arrow_back,color: Colors.white,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Function I', // Header text
                style: GoogleFonts.fraunces(
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




      floatingActionButton: CircularMenu(
        alignment: Alignment.bottomRight, // Align FAB in the bottom right corner
        toggleButtonColor: Colors.black,  // Color of the main button
        toggleButtonIconColor: Colors.white,
        radius: 110,// Icon color
        items: [
          CircularMenuItem(
            icon: Icons.home,
            color: Colors.transparent,
            iconColor: Colors.white,
            iconSize: 40,
            onTap: () {
              _navigateToHome(context); // Navigate to home page
            },
          ),
          CircularMenuItem(
            icon: Icons.looks_one,
            color: Colors.transparent,
            iconColor: Colors.white,
            iconSize: 40,
            onTap: () {
              _navigateToFun1(context);
              // Action for Option 1
            },
          ),
          CircularMenuItem(
            icon: Icons.looks_two_rounded,
            color: Colors.transparent,
            iconColor: Colors.white,
            iconSize: 40,
            onTap: () {
              // Action for Option 2
            },
          ),
          CircularMenuItem(
            icon: Icons.looks_3_rounded,
            color: Colors.transparent,
            iconColor: Colors.white,
            iconSize: 40,
            onTap: () {
              // Action for Option 4
            },
          ),
        ],
      ),
    );
  }
}