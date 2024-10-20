import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../full_screen_image.dart';

class GyroIntro extends StatefulWidget {
  const GyroIntro({super.key});

  @override
  _GyroIntro createState() => _GyroIntro();
}

class _GyroIntro extends State<GyroIntro> {
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
          'Introduction',
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
                      'Gyroscope',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Introduction',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '•	A gyroscope consists of a mass in the form of a rotor or wheel which is suspended in such a way that it is free to spin about an axis passing through its centre of mass and perpendicular to the plane of the rotor. This axis is referred to as the spin axis. Ideally the spin axis bearings should be frictionless so that any rotation imparted to the rotor is maintained.\n'
                      '•	If the gyroscope is not constrained in any way so that there are no forces acting upon the rotor so as to alter the direction in which the spin axis points, then the gyro is called a free gyroscope.'
                    '•	The best example of a free gyroscope is the earth itself which is rotating about one of its diameters, or indeed any astronomical body. Such bodies are freely suspended in space and if we disregard the small gravitational forces arising from the presence of other astronomical bodies, then the spinning earth may be considered to be free from any external forces which act to change the direction in which its spin axis points. The earth therefore exhibits the properties of a free gyroscope.\n'
                    '•	In order to construct a free gyroscope on the surface of the earth, the rotor must be supported against the effect of the earth’s gravity. The supports must be designed to maintain the freedom of the spin axis of the rotor to take up any direction without constraint.\n'
                    '•	For achieve this, the gyroscope is mounted on a circular ring in the same plane as its spin axis. This ring is connected to a vertical ring at points perpendicular to the spin axis. This vertical ring is then connected to the outer ring or frame at points perpendicular to the horizontal axis. By having such an arrangement, the gyroscope is not constrained in any way so as to alter the direction of the spin axis. It is then said to have ‘Three degrees of freedom’. Such a gyroscope having three degrees of freedom is called a ‘Free Gyroscope.\n\n'
                      '•	A free gyroscope will therefore have -\n'
                      '1.	Freedom to spin about the spin axis\n'
                    '2.	Freedom to tilt about the horizontal axis\n'
                    '3.	Freedom to turn in azimuth about the vertical axis.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FullScreenImagePage(imagePath: 'images/fun1/gyro_free.jpg',)),
                        );
                      },
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'images/fun1/gyro_free.jpg',
                              fit: BoxFit.cover,
                              height:400,
                            ),
                          ),
                          const SizedBox(height: 8), // Spacing between image and text
                          Center(
                            child: Text(
                              'A free Gyro\n',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                    const SizedBox(height: 10),
                    // Existing points...
                    Text(
                      '•	If such a rotor is made to rotate about its spin axis with a relatively high angular velocity, then the free gyroscope will exhibit the property of Gyroscopic Inertia or rigidity in space.\n'
                      '•	Apart from this, it also exhibits the property of ‘precession’ whenever a torque is applied to the spin axis.',
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

TableRow _buildTableRow(String vdrData, String svdrData) {
  return TableRow(
    children: [
      TableCell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            vdrData,
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ),
      ),
      TableCell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            svdrData,
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ),
      ),
    ],
  );
}

