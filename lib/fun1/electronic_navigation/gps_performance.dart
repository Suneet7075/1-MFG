import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


class GpsPerformance extends StatefulWidget {
  const GpsPerformance({super.key});



  @override
  _GpsPerformance createState() => _GpsPerformance();
}

class _GpsPerformance extends State<GpsPerformance> {
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

  final String url = 'https://wwwcdn.imo.org/localresources/en/KnowledgeCentre/IndexofIMOResolutions/MSCResolutions/MSC.115(73).pdf';
  Future<void> _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Performance Standards',
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
                      'Performance Standards\n',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),

                    Center(
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: _launchURL, // Open the URL when the button is clicked
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Colors.black, // Button background color (black)
                            shadowColor: Colors.white, // White shadow
                            elevation: 8, // Elevation to create shadow effect
                          ),
                          child: Text(
                            "IMO Official",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),


                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '\n- The Global Positioning System (GPS) is a space-based positioning, velocity and time system that has three major segments: space, control and user. The GPS space segment will normally be composed of 24 satellites in six orbits. The satellites operate in circular 20,200 km orbits at an inclination angle of 55" with a 12-hour period.\n\n'
                          '- The spacing of satellites in orbit will be arranged so that a minimum of four satellites will be in view to users world-wide, with a position dilution of precision (PDOP) of 6. Each satellite transmits on two "L" band frequencies, L1 (1575,42 MHz) and L2 (1227,6 MHz).\n\n'
                      '- L1 carries a precise (P) code and coarse/acquisition (C/A) code. L2 carries the P code. A navigation data message is superimposed on these codes. The same navigation data message is carried on both frequencies.\n\n'
                      '-The GPS receiver equipment should:\n\n'
                      '1) be capable of receiving and processing the Standard Positioning Service (SPS) and provide position information in latitude and longitude World Geodetic System (WGS)-84 co- ordinates in degrees, minutes and thousandths of minutes and time in UTC.\n\n'
                      '2) operate on the L1 signal and C/A code;\n\n'
                      '3) be provided with at least one output from which position information can be supplied to other equipment. The output of position information based upon WGS-84 should be in accordance with international standards.\n\n'
                      '4) have static accuracy such that the position of the antenna is determined to within 100 m (95%) with horizontal dilution of precision (HDOP) = 4 (or PDOP = 6);\n\n'
                      '5) have dynamic accuracy such that the position of the ship is determined to within 100 m (95%) with HDOP = 4 (or PDOP = 6) under the conditions of sea states and ships motion likely to be experienced in ships.\n\n'
                      '6) be capable of selecting automatically the appropriate satellite-transmitted signals for determining the ships position with the required accuracy and update rate;\n\n'
                      '7) be capable of acquiring position to the required accuracy, within 30 min, when there is novalid almanac data; \n\n'
                      '8) be capable of acquiring position to the required accuracy, within 5 min, when there is validalmanac data;\n\n'
                      '9) be capable of re-acquiring position to the required accuracy, within 5 min, when the GPS signals are interrupted for a period of at least 24 h but there is no loss of power;\n\n'
                      '10) be capable of re-acquiring position to the required accuracy, within 2 min, when subjected to a power interruption of 60 s;\n\n'
                      '11) have a minimum resolution of position, i.e. latitude and longitude, of 0.001 minutes;\n\n'
                        '12) When a GPS receiver is equipped with a differential receiver, performance standards for static and dynamic accuracies should be 10 m (95%);\n\n'
                      '-FAILURE WARNINGS AND STATUS INDICATIONS:-\n'
                      'an indication within 5 s if either:\n'
                      'a. the specified HDOP has been exceeded, or, a new position has not been calculated for more than 1s.\n'
                      'b. a warning of loss of position.\n'
                      'c. differential GPS status indication of: the receipt of DGPS signals and whether DGPS corrections are being applied to the indicated ships position.\n'
                      'd. DGPS text message display.\n\n',

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
