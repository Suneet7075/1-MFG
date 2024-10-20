import 'package:flutter/material.dart';
import 'package:polaris_chief_mate/fun1/electronic_navigation/vdr_intro.dart';
import 'package:polaris_chief_mate/fun1/electronic_navigation/vdr_performance.dart';
import 'package:polaris_chief_mate/fun1/electronic_navigation/vdr_solas.dart';


class VDR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'VDR',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Shift the buttons a bit up
          crossAxisAlignment: CrossAxisAlignment.stretch, // Make buttons take full width
          children: [
            SizedBox(height: 50), // Adds space to move buttons up
            CustomButton(title: 'Introduction', page: VdrIntro()),
            SizedBox(height: 20),
            CustomButton(title: 'SOLAS Requirement', page: VdrSolas()),
            SizedBox(height: 20),
            CustomButton(title: 'Performance Standard', page: VdrPerformance()),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final Widget page;

  CustomButton({required this.title, required this.page});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to the new page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.black, // Button background color (black)
        shadowColor: Colors.white, // White shadow
        elevation: 8, // Elevation to create shadow effect
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white, // White text
        ),
      ),
    );
  }
}

// Example new pages for each button

