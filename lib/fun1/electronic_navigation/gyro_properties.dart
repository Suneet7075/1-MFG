import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../full_screen_image.dart';

class GyroProperties extends StatefulWidget {
  const GyroProperties({super.key});

  @override
  _GyroProperties createState() => _GyroProperties();
}

class _GyroProperties extends State<GyroProperties> {
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
          'Gyro Properties',
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
                      'Two properties of the free gyroscope are:- ',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '(A)	Gyroscopic Inertia or Rigidity in Space',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '•	When the rotor of a free gyroscope is spinning, the forces that are acting of the rotor are the centrifugal force which is directed radially outwards and an equal and opposing force which is directed radially inwards. This opposing force is provided by the cohesion of the particles in the solid rotor. Both these forces are acting in directions which are in the plane of the rotor and therefore do not act to change the plane in which the rotor is orientated.\n'
                      '•	If the friction in the spin axis bearings is neglected, the rotor will continue to spin with a constant velocity and will maintain its orientation of the plane of the rotor in space. The spin axis will therefore preserve its orientation to a fixed point with respect to space. (not to a fixed point on earth). This property of the free gyroscope is known as Gyroscopic Inertia or Rigidity in space. This is due to the law of conservation of momentum.\n'
                      '•	It resists any attempt to change its direction of spin. Thus, a free gyroscope has high directional stability.\n'
                      '•	For a stationary observer on the Earth, it seems that the axis of the gyroscope completes a full rotation once in a day. This is because of the rotation of the Earth. In spite of the rigidity in space, the gyroscope on Earth will move along the direction of the rotation of the Earth, thus showing an apparent motion.\n'
                      '•	The gyroscopic inertia of a rotor may be expressed quantitatively by its angular momentum (H). This will determine how much force is necessary to change the direction in which the spin axis points at a given rate of spin. The angular momentum depends upon:\n\n'
                        'a)	Angular velocity of the rotor (ω) and\n'
                'b)	Moment of inertia of the cross section about the spin axis (I)\n\n'
                      '•	The moment of inertia of the cross section expresses the moment that the mass of the rotor exerts about the spin axis. This will determine how easy it is to initially set the rotor spinning or to increase or decrease the angular velocity when it is spinning, which is to change its state of motion.\n'
                      'The moment of inertia will depend upon the mass of the rotor and also upon the distribution of that mass with respect to the spin axis. The greater the proportion of mass which lies towards the circumference of the rotor the greater will be the moment of inertia and the greater will be the gyroscopic inertia for any given angular velocity. For this reason, the rotors are designed with a heavy rim and a relatively light internal construction which is only sufficient to maintain the strength of the rotor. The figure alongside shows the cross section of two rotors. The moment of inertia of the cross section of rotor A will be greater than of rotor B. Rotor A will therefore possess greater gyroscopic inertia for any given angular velocity of spin\n',


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
                          MaterialPageRoute(builder: (context) => FullScreenImagePage(imagePath: 'images/fun1/gyro_rotor.png',)),
                        );
                      },
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'images/fun1/gyro_rotor.png',
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

                    const SizedBox(height: 20),
                    Text(
                      '(B)	Gyroscopic Precession',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 10),
                    // Existing points...
                    Text(
                      '•	If a torque – a turning moment, in the plane of the spinning wheel is applied to a gyroscope axis, the effect is only to increase or decrease the rate of spin. The direction in which the spin axis lies is unaffected.\n\n'
                          '•	If a torque is applied to a gyroscope axis in a plane at right angles to the plane of spin, then the gyroscope becomes unbalanced. And to restore the balance it moves in a direction at right angles both to the plane of the spinning wheel and the plane in which the torque is applied.\n'
                      'This movement at right angles to the torque is known as precession.\n\n'
                      'And a balance is achieved. This in much the same way that a weight swung in a circle on the end of a string achieves a balance by virtue of its movement at right angles to the string although the force acting on the weight is along the length of the string.\n\n'
                      'The direction in which a gyroscope axis moves when a force is applied to it depends upon the direction in which the wheel is spinning.\n',
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
                          MaterialPageRoute(builder: (context) => FullScreenImagePage(imagePath: 'images/fun1/gyro_precession.png',)),
                        );
                      },
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'images/fun1/gyro_precession.png',
                              fit: BoxFit.cover,
                              height:500,
                            ),
                          ),
                          const SizedBox(height: 8), // Spacing between image and text
                          Center(
                            child: Text(
                              'Precession\n\n',
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

                    Text(
                      '• The rate of precession of the gyro axis is directly proportional to the applied torque and inversely proportional to the gyroscopic inertia which is expressed by the angular momentum possessed by the rotor. Thus,\n\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    Text(
                       '𝑃𝑟𝑒𝑐𝑒𝑠𝑠𝑖𝑜𝑛 ∝𝐴𝑝𝑝𝑙𝑖𝑒𝑑 𝑇𝑜𝑟𝑞𝑢𝑒/𝐴𝑛𝑔𝑢𝑙𝑎𝑟 𝑀𝑜𝑚𝑒𝑛𝑡𝑢𝑚\n\n',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
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


