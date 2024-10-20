import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../full_screen_image.dart';

class TiltDrift extends StatefulWidget {
  const TiltDrift({super.key});

  @override
  _TiltDrift createState() => _TiltDrift();
}

class _TiltDrift extends State<TiltDrift> {
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
          'Tilt & Drift',
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
                      'FREE GYROSCOPE ON THE ROTATING EARTH (TILT & DRIFT) ',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Tilt',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      '• If a free gyroscope is situated on the equator and lies with its axis East West and horizontal, it can be assumed of as pointing to a star with zero declination and is about to rise.\n\n'
                      '• The East End of the gyroscope axis will follow the movement of this star and will tilt upwards as the star rises.\n\n'
                      '• After nearly six hours the axis will be vertical and after nearly twelve hours the gyroscope will have turned completely over with the axis again horizontal but now the original East end of the axis would be pointing to the star setting due West.\n\n'
                      '• After one sidereal day, the gyroscope would have tilted through 360O and the star would again be rising.\n\n'
                      '• This rate of tilting of 360O in a day is a rate of 15O per hour.\n\n'
                      '• If the gyroscope had been situated on the equator with its axis lying in the North – South direction, then the North end would be pointing towards the Pole star and would then have no apparent movement relative to the Earth.\n\n'
                      '• The rate of tilting thus varies from zero when the axis is lying North – South to a maximum when it is lying East – West. That is the rate of tilting varies as the Sine of the Azimuth.\n\n'
                      '• A free gyroscope situated at a pole with its axis horizontal would have an apparent turntable motion due to the Earth’s rotation.\n\n'
                      '• That is it would follow a fixed star around the horizon but it would not rise or set.\n\n'
                      '• The rate of tilting thus varies from a maximum when the latitude is 0O to zero when the latitude is 90O. That is the rate of tilting varies as the Cosine of the Latitude.\n\n'
                      '• The direction of tilting is such that the end of the gyroscope axis, which lies to the East of the meridian, tilts upwards and the end of the axis, which lies to the West of the meridian tilts downward.\n',


                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Rate of tilting in degrees per hour = 15° sin Azimuth * cos Latitude.',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),


                    const SizedBox(height: 20),
                    Text(
                      'Drift',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      '• Drift is the apparent movement of a gyroscope in azimuth.\n\n'
                      '• A free gyroscope situated at the North Pole with its axis horizontal will have an apparent movement, which is entirely in the horizontal plane.\n\n'
                      'Its axis will appear to move in a clockwise direction when viewed from above. This would be due to the real counter clockwise rotation of the earth beneath, this circular motion causes the gyroscope to drift through 360° in one sidereal day, that is at a rate of 15° per hour.\n\n'
                      'A free gyroscope situated at the equator with its axis horizontal will not drift at all, irrespective of whether its axis is set in the North – South or East – West line.\n\n'
                      'The rate of drift for a gyroscope with its axis horizontal thus varies from a maximum at the poles to zero at the equator.\n',


                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Rate of Drift in degrees per hour = 15° sin Latitude.\n\n',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),


                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FullScreenImagePage(imagePath: 'images/fun1/tilt_drift.png',)),
                        );
                      },
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'images/fun1/tilt_drift.png',
                              fit: BoxFit.cover,
                              height:410,
                            ),
                          ),
                          const SizedBox(height: 8), // Spacing between image and text
                          Center(
                            child: Text(
                              '\n',
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


