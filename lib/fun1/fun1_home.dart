import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polaris_chief_mate/fun1/buoyage.dart';
import 'package:polaris_chief_mate/fun1/celestial_navigation.dart';
import 'package:polaris_chief_mate/fun1/chart_work.dart';
import 'package:polaris_chief_mate/fun1/electronic_navigation.dart';
import 'package:polaris_chief_mate/fun1/ice_navigation.dart';
import 'package:polaris_chief_mate/fun1/meterology.dart';
import 'package:polaris_chief_mate/fun1/misc_topics1.dart';
import 'package:polaris_chief_mate/fun1/ror.dart';

class Fun1 extends StatefulWidget {
  const Fun1({super.key});

  @override
  State<Fun1> createState() => _Fun1State();
}

class _Fun1State extends State<Fun1> {
  // List of image paths
  final List<String> imagePaths = [
    'images/ror.jpg',
    'images/meteorology.jpg',
    'images/iala_buoyage.jpg',
    'images/chart_work.jpg',
    'images/celestialnavigation.jpg',
    'images/electronicnavigation.jpg',
    'images/ice_navigation.jpg',
    'images/misc_topics.jpeg'
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
          MaterialPageRoute(builder: (context) => Buoyage()),
        );
        break;

      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChartWork()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CelestialNavigation()),
        );
        break;

      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ElectronicNavigation()),
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
          MaterialPageRoute(builder: (context) => MiscTopics1()),
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
                'Function I', // Header text
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
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.view_list, // Animated icon for FAB
        animatedIconTheme: IconThemeData(
          size: 26,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        overlayColor: Colors.transparent,
        overlayOpacity: 0.7,
        spacing: 12,
        closeManually: false,
        curve: Curves.easeInOut,
        children: [
          SpeedDialChild(
            child:Icon(Icons.home),
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
            label: 'Home',
            labelStyle: TextStyle(color: Colors.white),
            labelBackgroundColor: Colors.black,
            onTap: () {
              // Navigate to home
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.looks_one),
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
            label: 'Option 1',
            labelStyle: TextStyle(color: Colors.white),
            labelBackgroundColor: Colors.black,
            onTap: () {
              // Action for Option 1
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.looks_two_rounded),
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
            label: 'Option 2',
            labelStyle: TextStyle(color: Colors.white),
            labelBackgroundColor: Colors.black,
            onTap: () {
              // Action for Option 2
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.looks_3_rounded),
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
            label: 'Option 4',
            labelStyle: TextStyle(color: Colors.white),
            labelBackgroundColor: Colors.black,
            onTap: () {
              // Action for Option 4
            },
          ),
        ],
      ),
    );
  }
}
