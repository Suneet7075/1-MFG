import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../full_screen_image.dart';

class GyroControl extends StatefulWidget {
  const GyroControl({super.key});

  @override
  _GyroControl createState() => _GyroControl();
}

class _GyroControl extends State<GyroControl> {
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
          'Control Forces',
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
                      'Control Forces ',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),



                    const SizedBox(height: 20),
                    Text(
                      '1. Top Heavy Control Forces\n',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FullScreenImagePage(imagePath: 'images/fun1/gyro_top1.jpg',)),
                        );
                      },
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'images/fun1/gyro_top1.jpg',
                              fit: BoxFit.cover,
                              height:210,
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
                      'When spin axis is parallel to the earth’s surface then Gw and gR are in one direction and no force is applied to rotor south end or north end.\n',

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
                          MaterialPageRoute(builder: (context) => FullScreenImagePage(imagePath: 'images/fun1/gyro_top2.jpg',)),
                        );
                      },
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'images/fun1/gyro_top2.jpg',
                              fit: BoxFit.cover,
                              height:210,
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
                      'If the gyro spin axis tilts up, then Gw and gR are no more in one line. A force is applied to the south  end of axis.  The precession  of north  end of axis  will be  towards the  paper. (Westwards)\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '2. Bottom Heavy Control Forces\n',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FullScreenImagePage(imagePath: 'images/fun1/gyro_bottom1.jpg',)),
                        );
                      },
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'images/fun1/gyro_bottom1.jpg',
                              fit: BoxFit.cover,
                              height:210,
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
                      'When spin axis is parallel to earth’s surface,  then Gw and gR are in one line,  no force is exerted to spin axis. \n',

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
                          MaterialPageRoute(builder: (context) => FullScreenImagePage(imagePath: 'images/fun1/gyro_bottom2.jpg',)),
                        );
                      },
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'images/fun1/gyro_bottom2.jpg',
                              fit: BoxFit.cover,
                              height:210,
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
                      'If the gyro tilts up,  then Gw and gR  are no  more in one line. As seen it  is  like a force is applied to north end of gyro axle. The precession will be inside the paper. (Westwards) \n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Top heavy control using Liquid Ballistic Method',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),


                    const SizedBox(height: 10),
                    Text(
                      'Simple methods of control are not practical in commercial compasses, because of the problems encountered with  ship’s movement.  An improvement  is to  use a  LIQUID BALLASTIC  to give  a form of gravity as shown below. (Used in Sperry) \n',

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
                          MaterialPageRoute(builder: (context) => FullScreenImagePage(imagePath: 'images/fun1/gyro_ballast.jpg',)),
                        );
                      },
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'images/fun1/gyro_ballast.jpg',
                              fit: BoxFit.cover,
                              height:350,
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
                      'Liquid  flows  between  the north  and  south  ends  of  the  rotor  under  the  influence  of gravity, when the gyro has an angle of tilt\n'
                      'The principle is similar to that of top heavy gyro. The rotor spin direction is clockwise, as seen from north end, and hence when the gyro tilts up, it will produce a precession which moves the north end of spin axis to the west.\n'
                      'The  advantage of  the  system  is  that  the  liquid is  chosen  such  that  it  is  slow to  respond  to sudden changes caused by ship’s movement but will still respond to gradual changes produced by the earth’s movement.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'North Seeking Gyro\n',
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
                          MaterialPageRoute(builder: (context) => FullScreenImagePage(imagePath: 'images/fun1/gyro_north.jpg',)),
                        );
                      },
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'images/fun1/gyro_north.jpg',
                              fit: BoxFit.cover,
                              height:220,
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
                      'The figure  shows  the movement of  the projection of  the spin axis  of a controlled  gyro in the northern  hemisphere.  The  gyro  was  initially  set  up  parallel  to  the  earth’s  surface  pointing slightly east of the meridian.\n'
                      'The following abbreviations are used in the figure:\n'
                      'Pc: Represents the gyro’s precession due to the control force. This depends on the gyro’s angle of tilt.\n'
                      'D: Represents the gyro’s rate of drift due to the earth’s rotation. The nearer gyro’s angle of tilt to the elevation of the pole star, the less rate of drift. \n'
                      'T: Represents the rate of change and direction of tilt. It depends on how far in azimuth the gyro is from the meridian.\n'
                      'Point 1: This is where the gyro was initially set up, slightly to the east of meridian, but parallel to the earth’s surface. The control precession Pc will be zero. D & T will be the same as for the free gyro.\n'
                      'Point 2: The gyro has now gained an angle of tilt, therefore a control force is developed which will produce precession Pc opposing the eastward drift. The rate of drift “D” will have decreased because  the  gyro  is  closer  to  the  elevation  of  pole  star.  The rate  of  tilt  upwards  will  have increased, because the gyro is pointing further east of the meridian\n'
                      'Point 3:  The  angle  of  tilt  has  increased  such  that  Pc  now  equals  D,  so  there  is  no  further eastward drift. The rate of tilt is therefore at its maximum upwards.\n'
                      'Point 4: The angle of tilt is now such that Pc is greater than D, which is still reducing as the gyro approaches the elevation of the pole star. The gyro moves westward towards the meridian. This reduces the rate of tilt increase upwards.\n'
                      'Point 5: The westward movement has brought the gyro to the meridian, which means there is no increase in tilt. The angle of tilt is now a maximum and therefore D is a minimum and Pc is a maximum. The gyro therefore continues its westward movement past the meridian.\n'
                      'Point 6: The gyro is west of the meridian, therefore the rate of change of tilt is increasing, but in a downwards direction, reducing the angle of tilt. The reduction in angle of tilt reduces Pc and increases D, thus reducing the rate of westward movement.\n'
                      'Point 7: The  angle of tilt  has  decreased such that  Pc equals D.  This is the  most westward the gyro will travel. Therefore the rate of decrease in tilt T is at its maximum.\n'
                      'Point 8: The angle of tilt has decreased such that Pc is less than D, and the gyro drifts eastwards. This movement towards the meridian reduces the rate of decrease in angle of tilt.\n'
                      'Point 9: The gyro is again parallel to the earth’s surface, so Pc  is zero. The spin axis is pointing west of the meridian, so the movement of tilt is still downwards. The drift D is to the east and increasing as the spin axis moves away from the pole star.\n'
                      'Point 10:  The gyro  has again  reached the  meridian, so  there is  no  further change in  tilt. The angle  of tilt  is downward,  so Pc  now assists  the  eastward  drift. This  is  a maximum  since the gyro’s elevation is as far below the pole star as it will reach. The gyro therefore moves past the meridian back to point 1. \n'
                      'The gyro will then repeat its path around the ellipse, continuously moving around the meridian. The controlled gyro is therefore said to be NORTH SEEKING.\n\n',

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


