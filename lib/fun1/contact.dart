import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class Contact extends StatelessWidget {
  final String email = 'polaris1mfg@gmail.com';

  // Function to open email
  void _launchEmailApp() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Contact&body=Hello', // You can add a subject and body if needed
    );
    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(color: Colors.white), // White AppBar text
        ),
        backgroundColor: Colors.black, // AppBar with black color
        leading: IconButton( // Back arrow
          icon: Icon(Icons.arrow_back, color: Colors.white), // White back arrow
          onPressed: () {
            Navigator.pop(context); // Go back when pressed
          },
        ),
      ),
      backgroundColor: Colors.black, // Set page background color to black
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'polaris1mfg@gmail.com',
              style: GoogleFonts.fraunces(color: Colors.white,
                fontSize: 24,// White text
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 16), // Space between text and icon
            IconButton(
              icon: Icon(Icons.email, color: Colors.white, size: 50), // Colorful email icon
              onPressed: _launchEmailApp, // Open email app when pressed
            ),
          ],
        ),
      ),
    );
  }
}
