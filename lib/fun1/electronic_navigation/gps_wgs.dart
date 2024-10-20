import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../full_screen_image.dart';

class GpsWgs extends StatefulWidget {
  const GpsWgs({super.key});

  @override
  _GpsWgs createState() => _GpsWgs();
}

class _GpsWgs extends State<GpsWgs> {
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
          'WGS 84',
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
                      'World Geodetic System (WGS)\n',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),


                    const SizedBox(height: 10),
                    Text(
                      'GPS receivers operate on the World Geodetic System (WGS) global geocentric reference system, or datum. It is global because, unlike other datums that only apply to certain regions, WGS can be used over the entire Earth. It is geocentric because, unlike other datums that use arbitrary points within the Earth as their origin, the origin of WGS is at the actual center of the globe. Most military and commercial receivers allow the user the capability to select the reference datum, but the receiver will default to WGS if none is selected.\n\n'
                      'In other words, WGS 84 can be explained as:\n\n'
                      'WGS 84 is an Earth-centered, Earth-fixed terrestrial reference system and geodetic datum. WGS 84 is based on a consistent set of constants and model parameters that describe the Earths size, shape, and gravity and geomagnetic fields. WGS 84 is the standard U.S. Department of Defense definition of a global reference system for geospatial information and is the reference system for the Global Positioning System (GPS). It is compatible with the International Terrestrial Reference System (ITRS).\n\n',

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
                          MaterialPageRoute(builder: (context) => FullScreenImagePage(imagePath: 'images/fun1/wgs.jpg',)),
                        );
                      },
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'images/fun1/wgs.jpg',
                              fit: BoxFit.cover,
                              height:300,
                            ),
                          ),
                          const SizedBox(height: 8), // Spacing between image and text
                          Center(
                            child: Text(
                              '                WGS\n'
                              '(Source: Marine Gyaan)',
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


