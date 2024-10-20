import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


class VdrPerformance extends StatefulWidget {
  const VdrPerformance({super.key});





  @override
  _VdrPerformance createState() => _VdrPerformance();
}

class _VdrPerformance extends State<VdrPerformance> {
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

  final String url = 'https://wwwcdn.imo.org/localresources/en/KnowledgeCentre/IndexofIMOResolutions/MSCResolutions/MSC.333(90).pdf';
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

                    const SizedBox(height: 20),
                    Text(
                      '1. General',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'The purpose of a voyage data recorder (VDR) is to maintain a store, in a secure and retrievable form, of information concerning the position, movement, physical status, command and control of a vessel over the period leading up to and following an incident having an impact thereon. Information contained in a VDR should be made available to both the Administration and the shipowner. This information is for use during any subsequent investigation to identify the cause(s) of the incident.\n\n'
                          'A VDR with capabilities not inferior to those defined in these performance standards is required to be fitted to ships of classes defined in SOLAS chapter V, as amended.\n\n'
                          'References: 1995 SOLAS Conference, resolution 12.\n',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    Text(
                      '2. Operational Requirements:',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '2.1 General',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '2.1.1 The VDR should continuously maintain sequential records of preselected data items relating to the status and output of the ships equipment, and command and control of the ship.\n'

                    '2.1.2 To permit subsequent analysis of factors surrounding an incident, the method of recording should ensure that the various data items can be co-related in date and time during playback on suitable equipment.\n'

                    '2.1.3 The final recording medium should be installed in a protective capsule which should meet all of the following requirements:\n'
                    '.1 be capable of being accessed following an incident but secure against tampering;\n'
                    '.2 maximize the probability of survival and recovery of the final recorded data after any incident;\n'
                    '.3 be of a highly visible color and marked with retro-reflective materials; and\n'
                    '.4 be fitted with an appropriate device to aid location.\n'
                    '2..1.4 The design and construction, which should be in accordance with the requirements of resolution A.694(17) and international standards acceptable to the Organization*, should take special account of the requirements for data security and continuity of operation\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '2.2. Data selection and security',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'The minimum selections of data items to be recorded by the VDR. Optionally, additional items may be recorded provided that the requirements for the recording and storage of the specified selections are not compromised.\n'

                      '2.2.1 The equipment should be so designed that, as far as is practical, it is not possible to tamper with the selection of data being input to the equipment, the data itself nor that which has already been recorded. Any attempt to interfere with the integrity of the data or the recording should be recorded.\n'

                    '2.2.2 The recording method should be such that each item of the recorded data is checked for integrity and an alarm given if a non-correctable error is detected.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '2.3. Continuity of operation',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      ' To ensure that the VDR continues to record events during an incident, it should be capable of operating from the ships emergency source of electrical power.\n'

                    '2.3.1 If the ships emergency source of electrical power supply fails, the VDR should continue to record Bridge Audio from a dedicated reserve source of power for a period of 2 h. At the end of this 2 h period all recording should cease automatically.\n'

                    '2.3.2 Recording should be continuous unless interrupted briefly in accordance with 6 or terminated in accordance with 5.3.2. The time for which all stored data items are retained should be at least 12 h. Data items which are older than this may be overwritten with new data.\n\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    Text(
                      '4. Data items to be recorded',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '4.1 Date and time',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      ' Date and time, referenced to UTC, should be obtained from a source external to the ship or from an internal clock. The recording should indicate which source is in use. The recording method should be such that the timing of all other recorded data items can be derived on playback with a resolution sufficient to reconstruct the history of the incident in detail.',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '4.2 Ships position',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Latitude and longitude, and the datum used, should be derived from an electronic position-fixing system (EPFS). The recording should ensure that the identity and status of the EPFS can always be determined on playback.',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '4.3 Speed',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Speed through the water or speed over the ground, including an indication of which it is, derived from the ships speed and distance measuring equipment.',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '4.4 Heading',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'As indicated by the ships compass.',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '4.5 Bridge Audio',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'One or more microphones positioned on the bridge should be placed so that conversation at or near the conning stations, radar displays, chart tables, etc., are adequately recorded. As far as practical, the positioning of microphones should also capture intercom, public address systems and audible alarms on the bridge.',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '4.6 Communications audio',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'VHF communications relating to ship operations should be recorded.',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '4.7 Radar data, post-display selection',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'This should include electronic signal information from within one of the ships radar installations which records all the information which was actually being presented on the master display of that radar at the time of recording. This should include any range rings or markers, bearing markers, electronic plotting symbols, radar maps, whatever parts of the SENC or other electronic chart or map that were selected, the voyage plan, navigational data, navigational alarms and the radar status data that were visible on the display. The recording method should be such that, on playback, it is possible to present a faithful replica of the entire radar display that was on view at the time of recording, despite within the limitations of any bandwidth compression techniques that are essential to the working of the VDR.',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '4.8 Echo sounder',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'This should include depth under keel, the depth scale currently being displayed and other status information where available.',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '4.9 Main alarms',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'This should include the status of all mandatory alarms on the bridge.',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '4.10 Rudder order and response',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'This should include status and settings of auto-pilot if fitted.',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '4.11 Engine order and response',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'This should include the positions of any engine telegraphs or direct engine/propeller controls and feedback indications, if appropriate, including ahead/astern indicators. This should also include status of bow thrusters if fitted.',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '4.12 Hull opening status',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'This should include all mandatory status information required to be displayed on the bridge.',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '4.13 Watertight and fire door status',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'This should include all mandatory status information required to be displayed on the bridge.',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '4.14 Accelerations and hull stresses',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Where a ship is fitted with hull stress and response monitoring equipment, all the data items that have been pre-selected within that equipment should be recorded.',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '4.15 Wind speed and direction',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'This should be applicable where a ship is fitted with a suitable sensor. Either relative or true wind speed and direction may be recorded, but an indication of which it is should be recorded.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    Text(
                      '5. Operation',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      'The unit should be entirely automatic in normal operation. Means should be provided whereby recorded data may be saved by an appropriate method following an incident, with minimal interruption to the recording process.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    Text(
                      '6. Interfacing',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      'Interfacing to the various sensors required should be in accordance with the relevant international interface standard, where possible. Any connection to any item of the ships equipment should be such that the operation of that equipment suffers no deterioration, even if the VDR system develops faults.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    Text(
                      '7. Ergonomics',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '7.1 The following functions should be directly accessible and immediately effected:',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),


                    const SizedBox(height: 10),
                    Text(
                      '- On-/off-switch\n '
                          '- Gain\n '

                         '- Monitor brilliance\n '

                       '- Presentation made\n '

                       '- Tuning (if manual)\n '

                        '- Anticlutter sea\n '

                  '- Range selection\n '

                  '- Variable range marker\n '

                  '- Anticlutter rain\n '

                  '- Maker (cursor)\n '

                  '- Electronic bearing line\n '

            '- Dimmer for panel illumination\n ',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '7.2 The following functions should be continuously variable or in small, quasi-analogue steps:',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),


                    const SizedBox(height: 10),
                    Text(
                      '- Monitor brilliance\n '
                          '- Anticlutter sea\n '

                          '- Tuning (if manual)\n '

                          '- Variable range marker\n '

                          '- Anticlutter rain\n '

                          '- Maker (cursor)\n '

                          '- Electronic bearing line\n '

                          '- Gain\n ',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '7.3 The settings of the following functions should be readable in all light condition:',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),


                    const SizedBox(height: 10),
                    Text(
                      '- Dimmer for panel illumination\n '
                          '- Tuning (if manual)\n '

                          '- Gain\n '

                          '- Anticlutter rain\n '

                          '- Anticlutter sea\n '

                          '- Monitor brilliance\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '7.4 for the following functions additional automatic adjustment may be provided. The use of the automatic mode be indicated to the operator and be capable of being switched off:',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      '- Monitor brilliance\n '
                          '- Gain\n '

                          '- Anticlutter rain\n '

                          '- Anticlutter sea\n ',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '7.5 If discrete controls are available for the EBL and VRM they should be situated on the left and right hand sides respectively.',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '8. Data Output Interface',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'The VDR should provide an interface for downloading the stored data and playback the information to an external computer. The interface should be compatible with an internationally recognized format, such as Ethernet, USB, FireWire, or equivalent.',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '9. Software For Data Downloading And Playback',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '9.1  A copy of the software program providing the capability to download the stored data and playback the information onto a connected external laptop computer and for the playback of the data should be provided for each VDR installation.\n'

                        '9.1.1     The software should be compatible with an operating system available with commercial-off-the-shelf laptop computers and provided on a portable storage device such as a CD-ROM, DVD, USB memory stick, etc.\n'

                        '9.1.2  Instructions for executing the software and for connecting the external laptop computer to the VDR should be provided.\n'

                   '9.1.3  The portable storage device containing the software, the instructions and any special (not commercial-off-the-shelf) parts necessary for the physical connection of the external laptop computer, should be stored within the main unit of the VDR.\n'

              '9.1.4  Where non-standard or proprietary formats are used for storing the data in the VDR, the software for converting the stored data into open industry standard formats should be provided on the portable storage device or resident in the VDR.\n\n',

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
