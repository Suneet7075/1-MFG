import 'package:flutter/material.dart';
import 'package:polaris_chief_mate/fun1/ice_navigation/ice_equipments.dart';
import 'package:polaris_chief_mate/fun1/ice_navigation/ice_nav.dart';
import 'package:polaris_chief_mate/fun1/ice_navigation/ice_type.dart';
import 'package:polaris_chief_mate/fun1/ice_navigation/polar_code.dart';
import 'package:polaris_chief_mate/fun1/ice_navigation/preparing_ship.dart';
import 'package:polaris_chief_mate/fun1/ice_navigation/sign_ice.dart';
import '../electronic_navigation/gyro_intro.dart';
import '../electronic_navigation/gyro_properties.dart';

class IceNavigation extends StatelessWidget {
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
          'Ice Navigation',
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
            CustomButton(title: 'Navigation, Planning & Precaution', page: IceNav()),
            SizedBox(height: 20),
            CustomButton(title: 'Types of Ice', page: IceType()),
            SizedBox(height: 20),
            CustomButton(title: 'Sign Of Ice', page: SignIce()),
            SizedBox(height: 20),
            CustomButton(title: 'Preparing Ship for Ice', page: PreparingShip()),
            SizedBox(height: 20),
            CustomButton(title: 'Equipments', page: IceEquipments()),
            SizedBox(height: 20),
            CustomButton(title: 'Polar Code', page: PolarCode()),


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

