import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullScreenImagePage extends StatelessWidget {
  final String imagePath; // Add a field to take the image path

  FullScreenImagePage({required this.imagePath}); // Constructor to accept the image path

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context); // Close the full-screen view on tap
        },
        child: Center(
          child: Image.asset(
            imagePath, // Use the passed image path
            fit: BoxFit.contain, // Ensures the image fits the screen without distortion
            width: double.infinity, // Make the image take up full screen width
            height: double.infinity, // Make the image take up full screen height
          ),
        ),
      ),
    );
  }
}
