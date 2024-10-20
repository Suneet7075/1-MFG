import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../full_screen_image.dart';

class GyroErrors extends StatefulWidget {
  const GyroErrors({super.key});

  @override
  _GyroErrors createState() => _GyroErrors();
}

class _GyroErrors extends State<GyroErrors> {
  final ScrollController _scrollController = ScrollController();
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateProgress);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateProgress);
    _scrollController.dispose();
    super.dispose();
  }

  void _updateProgress() {
    if (_scrollController.hasClients) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.offset;
      setState(() {
        _progress = maxScroll == 0 ? 0 : currentScroll / maxScroll;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Errors',
          style: GoogleFonts.playfairDisplay(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          LinearProgressIndicator(
            value: _progress,
            color: Colors.blue,
            backgroundColor: Colors.grey[800],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ERRORS OF THE GYRO COMPASS:-',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '1) Latitude (or damping) error',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      'This error is present in a compass which is damped in tilt. A compass damped in tilt always settles east of the meridian and above the horizon in NH, and vice-versa. Its magnitude depends on the observers latitude, Sin (error) Tan (latitude), At equator, the error is nil. The error is eastward in all northerly latitudes, and vice-versa.\n'
                          'For the purpose of damping error, a latitude rider/adjuster is provided with the gyro compass which shifts the lubber line equal to the amount of error in the appropriate direction.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '2) Speed Error (Course, Speed and Latitude Error)',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      'The gyro compass settles in the N/S direction by sensing Earths spinning motion. Same gyro compass when placed on a ship also senses the ships motion. And therefore, the axis of gyro compass settles in a direction which is perpendicular to the resultant of the Earths surface speed and the ships velocity.\n\n'
                          'The direction in which the compass settles, is therefore, different to the direction of the True North and depends on ships course, speed and latitude of the observer. This error also increases as the observers latitude increases. The error is westward on allNortherly courses and vice-versa. \n\n'
                      'In exactly E-W courses, the error is nil. In exactly N-S courses, the error is maximum. To compensate for steaming error, a speed rider is provided, which in association with the latitude rider, shifts the lubber line equal to steaming error in the appropriate direction.',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),


                    const SizedBox(height: 20),
                    Text(
                      '3) BALLISTIC DEFLECTION ERROR',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      'A temporary oscillatory error of the gyro compass introduced when the north-south component of the speed changes as by speed or course. Change, An accelerating force acts upon the compass, causing a surge of mercury from one part of the system to another in the case of the non-pendulous compass, or a deflection of a mass in the case of a pendulous compass.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '4) BALLISTIC DAMPING ERROR',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      'A temporary oscillatory error of a gyro compass introduced during changes of course and speed as a result of the means used to damp the oscillations of the spin axis.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '5) GIMBALLING ERROR',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      'This is due to the tilt of the compass rose Directions are measured in the horizontal plane. If the compass card is tilted, the projection of the outer rim in the horizontal is an ellipse, and the graduations are not equally spaced. For normal angles of tilt, this error is small and can be neglected\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),


                  ],


                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


