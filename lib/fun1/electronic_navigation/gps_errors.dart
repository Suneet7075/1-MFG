import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../full_screen_image.dart';

class GpsErrors extends StatefulWidget {
  const GpsErrors({super.key});

  @override
  _GpsErrors createState() => _GpsErrors();
}

class _GpsErrors extends State<GpsErrors> {
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
                      'ERRORS OF GPS:-',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '1) Lonospheric and tropospheric delay',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      'The radio waves radiated by the satellite when passing through the different layers of the ionosphere and troposphere, the velocity of the waves vary which affects the time difference measurement and the fix will not be accurate.\n'
                          'In case of signals from a satellite with low elevation, the refraction of radio waves will be more which will increase this error. Hence the receiver is designed not to select the satellites whose elevation is less than 9.5°.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '2) Users clock error',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      'If the user clock is not perfectly synchronized with the satellites clock, the range measurement will not be accurate and the range measurement along with the clock error is known as PSEUDO RANGE. This error can be eliminated within the receiver on board by obtaining the pseudo range from three satellites and is done automatically within the receiver.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),


                    const SizedBox(height: 20),
                    Text(
                      '3) Satellite clock error',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      'this error is caused due to the error in the satellites clock w.r.t. GPS time. This is monitored by the ground based segments and any error in the satellites clock forms part of the 30 seconds navigational message.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '4) Geometric dilution of precision (GDOP)',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      'The geometry of the satellite determines the angle of cut which in turns governs the quality of the position obtained. Wider the angular separation between the satellites, more accurate is the fix as the intersection will be almost at right angles.\n'
                      'The lower the GDOP value higher the accuracy of the fix and this GDOP value is indicated on the display unit.Since the receiver knows the position of all the satellites through 30 seconds navigational message, it is programmed to select the best available satellites considering their elevation and geometry.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '5) Multipath error',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      'this error is caused by satellite signals arriving at the ships antenna both directly from the satellite and having been reflected by some other objects. Thus, the two signals are received simultaneously which will cause the distortion of signal from which range measurement is obtained. Siting the antenna at a suitable place can minimize this error.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '5) Deviation of the satellite from the predicted path',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      'The satellites are monitored and their path are predicted by ground based segment. However between two consecutive monitoring of the same satellites, there may be minor drifts from their predicted paths resulting in small position inaccuracy.\n\n',

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


