import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Credits extends StatelessWidget {
  const Credits({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Credits',
          style: GoogleFonts.fraunces(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        elevation: 0, // Remove shadow for a sleeker look
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Circular image with a border, aligned downward
              CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage('images/pics_suneet.jpg'), // Replace with your image path
                backgroundColor: Colors.transparent,
                child: Align(
                  alignment: Alignment.bottomCenter, // Align image to the bottom
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Name with Google Fonts Fraunces
              Text(
                'Suneet Kumar',
                style: GoogleFonts.fraunces(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              SizedBox(height: 15),
              // LinkedIn icon with link
              GestureDetector(
                onTap: () async {
                  const url = 'https://www.linkedin.com/in/suneet-kumar-a52a8953/'; // Updated LinkedIn URL
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Icon(
                    AntDesign.linkedin_square,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Bullet points with improved styling
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBulletPoint('• Point 1: Description of point 1'),
                    _buildBulletPoint('• Point 2: Description of point 2'),
                    _buildBulletPoint('• Point 3: Description of point 3'),
                    _buildBulletPoint('• Point 4: Description of point 4'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build bullet points with custom styling
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white70,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
