import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../full_screen_image.dart';

class GpsIntro extends StatefulWidget {
  const GpsIntro({super.key});

  @override
  _GpsIntro createState() => _GpsIntro();
}

class _GpsIntro extends State<GpsIntro> {
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
                      'Global Positioning System (GPS)',
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
                      '-The Global Positioning System (GPS) is a space-based navigation system which consists of 24 navigational satellites in 6 different orbits that provides location and time information in all weather conditions, anywhere on or near the Earth where there is an unobstructed line of sight to four or more GPS satellites.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),


                    const SizedBox(height: 20),
                    Text(
                      'Structure of GPS',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '1. Space Segment',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      '•	Broadcasts coded radio signals and timing signals towards users on the earth\n'
                      '•	Receive commands from the ground stations\n'
                      '•	Atleast 24 satellites or space vessels, 6 orbital planes i.e. atleast 4 satellites per orbit.\n'
                      '•	Equally spaced orbits (60 degrees apart), inclined at about 550 w.r.t. the equatorial plane\n'
                      '•	At least 6 satellites are visible at all times from any point on earth and at least 4 satellites will have an elevation of over 9.50. Additional satellites are provided as back-up in case of failure of operational satellites\n'
                      '•	Satellites orbit at an altitude of approximately 20200 km above the surface of the Earth\n'
                      '•	Each satellites makes 2 complete orbit each day with a speed of 3.9 km / sec.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '2. Control Segment',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      '•	It consists of a Master control station (Colorado), an Alternate Master control station (California), four dedicated ground antennas (Two In Atlantic Ocean, One Each In Indian Ocean And Pacific Ocean), and six dedicated monitor stations (one each at the master control station and the four ground antenna stations)\n'
                          '•	The monitoring stations track and obtain data from the satellites and pass the information to the Master control station.\n'
                          '•	The master control station calculates and predicts the future path and position of all GPS satellites. It also determines the error of the atomic clocks in the satellites and provides the corrections required to keep them synchronised with ground clocks. Clock offset to correct to UTC is also computed.\n'
                          '•	The satellite ephemeris, almanac for all satellites and satellite status information is uploaded to the satellites from the Master station through the ground [antenna] stations.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '3. User Segment',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      '•	Records and interprets the radio signals broadcast by the satellites.\n'
                          '•	It consists of a receiving antenna, a GPS receiver with built-in processor and a display unit.\n'
                          '•	They usually interact with other nav. Systems using standard communication protocols like NMEA183, etc providing time, position, elevation, speed, direction, etc.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Principle of GPS',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),



                    const SizedBox(height: 10),
                    Text(
                      '•	GPS works on the principle of ‘Ranging’. The GPS receiver calculates its position by comparing its own self-generated timing signals with timing signals sent by orbiting GPS satellites. The time taken by the satellite signal to reach the receiver multiplied by the speed of radio waves gives the range to the satellite. Three ranges from 3 satellites are used for 2-D fixing while 4 ranges from 4 satellites are used for a 3-D fix.\n'
                          '•	Average Speed and direction is obtained from successive position fixes. Instantaneous speed is obtained from the Doppler shift of the satellite carrier frequency.\n'
                          '•	They usually interact with other nav. Systems using standard communication protocols like NMEA183, etc providing time, position, elevation, speed, direction, etc.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FullScreenImagePage(imagePath: 'images/fun1/gps_1.png',)),
                        );
                      },
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'images/fun1/gps_1.png',
                              fit: BoxFit.cover,
                              height:320,
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

                    const SizedBox(height: 10),
                    Text(
                      '•	Consider Satellites 1, 2 and 3 and a GPS receiver on the Earth. Say Satellite 1 transmits signal at time ‘t’ and the GPS receiver picks up the signal at time ‘t1’. Therefore, Range (R) = C x (t-t1)Where, C=speed of radio waves (3 x 108), (t-t1) = time taken for signal to reach receiver.	We are thus located on the surface of a sphere of radius P1, centered on satellite 1.\n'
                          '•	Similarly, we can get P2 and P3 using the other two satellites. Knowing location of all 3 satellites in space, we get 3 ranges that intersect at P which is the FIX.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Ranging Principle to Fix the Ship',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),



                    const SizedBox(height: 10),
                    Text(
                      '•	The GPS concept is based on time and the known position of specialized satellites. The satellites carry very stable atomic clocks that are synchronized to each other and to ground clocks. Any drift from true time maintained on the ground is corrected daily. Likewise, the satellite locations are known with great precision. GPS receivers have clocks as well; however, they are not synchronized with true time, and are less stable. GPS satellites continuously transmit their current time and position. A GPS receiver monitors multiple satellites and solves equations to determine the precise position of the receiver and its deviation from true time. The time difference between data transmitted from the satellite and its reception at the receiver is measured (which is in Nano-seconds) and integrated with speed of light (3 X 10 meters per second). i.e. d= s x At At a minimum, four satellites must be in view of the receiver for it to compute four unknown quantities (three position coordinates and clock deviation from satellite time).\n\n'
                          '- The GPS satellites transmit signals on two carrier frequencies.\n'
                          '1. The L1 carrier is 1575.42 MHz and carries both the status message and a pseudo-random code for timing.\n'
                      '2. The L2 carrier is 1227.60 MHz and is used for the more precise military pseudo-random code.\n',

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


