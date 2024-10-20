import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../full_screen_image.dart';

class Dgps extends StatefulWidget {
  const Dgps({super.key});

  @override
  _Dgps createState() => _Dgps();
}

class _Dgps extends State<Dgps> {
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
          'DGPS',
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
                      'DGPS',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),


                    const SizedBox(height: 10),
                    Text(
                      'Differential Global Positioning System (DGPS) is an enhancement to Global Positioning System that uses a network of fixed, ground-based reference stations to broadcast the difference between the positions indicated by the satellite systems and the known fixed positions. These stations broadcast the difference between the measured satellite pseudo ranges and actual (internally computed) pseudo ranges, and receiver stations may correct their pseudo ranges by the same amount. The correction signal is typically broadcast over UHF radio modem.\n\n'
                          'DGPS techniques are called the Ground Based Augmentation System and Ground based Regional Augmentation Systems. Both of these systems broadcast corrections via the aviation VHF band.\n\n'
                      'A similar system that transmits range corrections from orbiting satellites instead of ground- based transmitters is called a Satellite Based Augmentation System.',

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
                          MaterialPageRoute(builder: (context) => FullScreenImagePage(imagePath: 'images/fun1/dgps.png',)),
                        );
                      },
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'images/fun1/dgps.png',
                              fit: BoxFit.cover,
                              height:250,
                            ),
                          ),
                          const SizedBox(height: 8), // Spacing between image and text
                          Center(
                            child: Text(
                              'DGPS\n',
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


