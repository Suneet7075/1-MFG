import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:polaris_chief_mate/about.dart';
import 'package:polaris_chief_mate/fun.dart';
import 'package:polaris_chief_mate/credits.dart';
import 'package:polaris_chief_mate/fun1/contact.dart';
import 'package:polaris_chief_mate/index_page.dart';
import 'login_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  // List of icons for each card
  final List<IconData> cardIcons = [
    Icons.school,
    Icons.book,// Icon for Orals (second card)
  ];

  // List of titles for each icon
  final List<String> titles = [
    'Orals',
    'Index',
   // Ensure matching number of titles with icons
  ];

  // Function to navigate to specific screens
  void _navigateToDetails(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Fun()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => IndexPage()),
        );
        break;

    }
  }

  void _navigateToCredits(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Credits()), // Navigate to Credits page
    );
  }

  void _navigateToAbout(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => About()), // Navigate to ProfileUpdatePage
    );
  }

  void _navigateToContact(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Contact()), // Navigate to ProfileUpdatePage
    );
  }

  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut(); // Sign out the user
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()), // Navigate to LoginScreen
          (route) => false, // Remove all previous routes
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
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'HOME', // Header text
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
            actions: [
              PopupMenuButton<String>(
                icon: Container(
                  color: Colors.black, // Background color for the icon
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.more_vert,
                    color: Colors.white, // Icon color
                  ),
                ),
                color: Colors.black, // Background color of the popup menu
                onSelected: (value) {
                  if (value == 'credits') {
                    _navigateToCredits(context); // Navigate to Credits page
                  } else if (value == 'about') {
                    _navigateToAbout(context);
                    // Navigate to ProfileUpdatePage
                  } else if (value == 'contact') {
                    _navigateToContact(context);
                    // Navigate to ProfileUpdatePage
                  } else if (value == 'logout') {
                    _logout(context); // Logout the user and navigate to Login screen
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem<String>(
                      value: 'credits',
                      child: Text(
                        'Credits',
                        style: TextStyle(
                          color: Colors.white, // Text color
                        ),
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'about',
                      child: Text(
                        'About',
                        style: TextStyle(
                          color: Colors.white, // Text color
                        ),
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'contact',
                      child: Text(
                        'Contact Us',
                        style: TextStyle(
                          color: Colors.white, // Text color
                        ),
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'logout',
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white, // Text color
                        ),
                      ),
                    ),
                  ];
                },
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.0,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                mainAxisExtent: 200,
              ),
              delegate: SliverChildBuilderDelegate(
                    (ctx, i) {
                  return GestureDetector(
                    onTap: () {
                      _navigateToDetails(context, i); // Navigate to the specific screen
                    },
                    child: Card(
                      color: Colors.grey.withOpacity(0.25), // Elegant black card background
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              cardIcons[i],
                              size: 50,
                              color: Colors.white.withOpacity(0.9), // Elegant icon color
                            ),
                            const SizedBox(height: 20),
                            Text(
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
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: cardIcons.length, // Matching icon count with number of cards
              ),
            ),
          ),
        ],
      ),
    );
  }
}
