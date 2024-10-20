import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'About',
              style: GoogleFonts.playfairDisplay(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Polaris 1MFG is a pioneering app tailored specifically for those preparing for Chief Mate oral exams. As the first app of its kind, it offers a comprehensive and structured study resource, compiling material from a wide array of notes and sources. The app is designed to provide users with an in-depth, all-in-one preparation tool, making it easier to navigate through complex subjects and concepts crucial for Chief Mate certification. With its user-friendly interface and organized content, Polaris 1MFG stands out as an indispensable guide for maritime professionals aiming for excellence.',
              style: GoogleFonts.roboto(
                fontSize: 18,
                color: Colors.white70,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
            Spacer(),

          ],
        ),
      ),
    );
  }
}