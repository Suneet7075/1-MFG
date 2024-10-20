import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

// Helper function to launch the LinkedIn URL
Future<void> _launchLinkedIn(String url) async {
  final Uri uri = Uri.parse(url.trim());  // Clean up the URL by removing spaces
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    print('Could not launch $url');
  }
}

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
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        elevation: 0, // Remove shadow for a sleeker look
      ),
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          const SizedBox(height: 20),
          _buildProfileTile(
            context,
            name: 'Suneet Kumar',
            imagePath: 'images/pics_suneet.jpeg',
            linkedInUrl: 'https://www.linkedin.com/in/suneet-kumar-a52a8953/',
            description:
            '• Owner and Developer\n'
                '• AVP at HSBC\n'
                '• IIM Lucknow Class of 2023\n'
                '• T.S Chanakya Class of 2013\n'
                '• Ex-Second Navigating Officer, FML\n'
                '• President Gold Medalist 2013',
          ),

          const SizedBox(height: 20),
          _buildProfileTile(
            context,
            name: 'Gautam Sharad',
            imagePath: 'images/pics_gautam.jpeg',
            linkedInUrl: 'https://www.linkedin.com/in/gautam-sharad/',
            description:  '• iOS Build Support\n'
                '• Sr. Manager at Wipro\n'
                '• IIM Bangalore Class of 2023\n'
                '• T.S Chanakya Class of 2013\n'
                '• Ex-Second Navigating Officer, Maersk\n'
                ,
          ),
          const SizedBox(height: 20),
          _buildProfileTile(
            context,
            name: 'Manish Abhishek',
            imagePath: 'images/pics_manish.jpg',
            linkedInUrl: 'https://www.linkedin.com/in/manish-abhishek-799ba91ba/',
            description: '• Content Lead\n'
                '• Chief Officer\n'
                '• President Gold Medalist 2014\n'
                '• T.S Chanakya Class of 2014\n'
                '• Cleared 2MFG in 1st Attempt\n'
            '• Cleared 1MFG in 1st Attempt\n'
          ),
          const SizedBox(height: 20),
          _buildProfileTile(
            context,
            name: 'Kumar Sambhav',
            imagePath: 'images/pics_sambhav.jpg',
            linkedInUrl: 'https://www.linkedin.com/in/kumar-sambhav-529638321/?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
            description: '• Content Lead\n'
                '• Chief Officer\n'
              '• T.S Chanakya Class of 2014\n',

          ),

        ],
      ),
    );
  }

  // Helper method to build each profile tile
  Widget _buildProfileTile(BuildContext context,
      {required String name,
        required String imagePath,
        required String linkedInUrl,
        required String description}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileDescriptionPage(
              name: name,
              imagePath: imagePath,
              linkedInUrl: linkedInUrl,
              description: description,
            ),
          ),
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: imagePath.isNotEmpty
                ? AssetImage(imagePath)
                : null, // Set null if image path is empty
            backgroundColor: Colors.transparent,
            child: imagePath.isEmpty
                ? const Icon(Icons.person, size: 50, color: Colors.white)
                : null, // Fallback icon if no image is provided
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: GoogleFonts.fraunces(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

// New page to show the profile description
class ProfileDescriptionPage extends StatelessWidget {
  final String name;
  final String imagePath;
  final String linkedInUrl;
  final String description;

  const ProfileDescriptionPage({
    super.key,
    required this.name,
    required this.imagePath,
    required this.linkedInUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 30.0,
          top: 30.0,
          right: 40.0,
          bottom: 0.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: imagePath.isNotEmpty
                  ? AssetImage(imagePath)
                  : null, // Fallback if no image is provided
              backgroundColor: Colors.transparent,
              child: imagePath.isEmpty
                  ? const Icon(Icons.person, size: 80, color: Colors.white)
                  : null,
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: GoogleFonts.fraunces(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                try {
                  await _launchLinkedIn(linkedInUrl); // Launch LinkedIn URL
                } catch (e) {
                  print("Error launching LinkedIn: $e");
                }
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: const Icon(
                  AntDesign.linkedin_square,
                  color: Colors.blue,
                  size: 40,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity, // Makes the container take the full width
              padding: const EdgeInsets.symmetric(horizontal: 0.0), // Optional padding for better appearance
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.start,
              ),
            ),

          ],
        ),
      ),
    );
  }

}
