import 'package:flutter/material.dart';
import 'package:polaris_chief_mate/fun1/electronic_navigation/gyro_control.dart';
import 'package:polaris_chief_mate/fun1/electronic_navigation/gyro_damping.dart';
import 'package:polaris_chief_mate/fun1/electronic_navigation/gyro_errors.dart';
import 'package:polaris_chief_mate/fun1/electronic_navigation/gyro_intro.dart';
import 'package:polaris_chief_mate/fun1/electronic_navigation/gyro_performance.dart';
import 'package:polaris_chief_mate/fun1/electronic_navigation/gyro_properties.dart';
import 'package:polaris_chief_mate/fun1/electronic_navigation/tilt_drift.dart';


import 'gyro_misc.dart';


class Gyro extends StatelessWidget {
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
          'Gyro Compass',
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
            CustomButton(title: 'Introduction', page: GyroIntro()),
            SizedBox(height: 20),
            CustomButton(title: 'Gyro Properties', page: GyroProperties()),
            SizedBox(height: 20),
            CustomButton(title: 'Tilt and Drift', page: TiltDrift()),
            SizedBox(height: 20),
            CustomButton(title: 'Control Forces', page: GyroControl()),
            SizedBox(height: 20),
            CustomButton(title: 'Damping', page: GyroDamping()),
            SizedBox(height: 20),
            CustomButton(title: 'Errors', page: GyroErrors()),
            SizedBox(height: 20),
            CustomButton(title: 'Performance Standards', page: GyroPerformance()),
            SizedBox(height: 20),
            CustomButton(title: 'Misc.', page: GyroMisc()),
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
        backgroundColor: Colors.black,// Button background color (black)
        shadowColor: Colors.white, // White shadow
        elevation: 5, // Elevation to create shadow effect
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

