import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../full_screen_image.dart';

class VdrIntro extends StatefulWidget {
  const VdrIntro({super.key});

  @override
  _VdrIntro createState() => _VdrIntro();
}

class _VdrIntro extends State<VdrIntro> {
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
                      'VOYAGE DATA RECORDER (VDR)',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'VDR',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Voyage data recorder, or VDR, is a data recording system designed to collect data from various sensors on board a vessel so as to enable accident investigators to review procedures and instructions in the moments before an incident and help to identify the cause of any accident. It is similar to ‘Black Box’ carried on aircrafts.',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'S-VDR',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Existing points...
                    Text(
                      'A simplified voyage data recorder (S-VDR), which is a lower cost simplified version of VDR and requires only basic ships data to be recorded.',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Function',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '•	The main purpose of the VDR is to facilitate reconstruction of an incident for the purpose of analysis. For this, the VDR digitizes, compresses and stores the collected information in a secure and retrievable form, in an externally mounted retrievable protective storage unit.\n\n'
                          '•	The VDR will continuously maintain sequential records of pre-selected data, related to status and output of various ship’s equipments, command and control of the ship.\n\n'
                    '•	Other valuable use of recorded data provides for preventive maintenance, performance efficiency monitoring, heavy weather damage analysis, near miss analysis and training purposes to improve safety and reduce running costs.',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'VDR Modules',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '1.	Data Acquisition Module ',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'The job of this unit is to acquire and process all the data, so that it can be stored in the specific format. The data is fed to this unit through various interfaces. It has an additional hard drive that can be used for retrieval of data.\n',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    Text(
                      '2.	Audio Module ',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'This module consists of an audio mixer for recording various signals / voices from the microphones placed in the wheelhouse, bridge wings, etc. Apart from Bridge audio, it also processes VHF audio and sends output to the Data Acquisition Module.\n',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    Text(
                      '3.	Bridge Remote Alarm Module  ',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'This consists of a small panel connected to the Data Acquisition Module that generates an audible and visual alarm to indicate any error status of any equipment. It also allows for saving of recorded data.\n',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    Text(
                      '4.	Sensor Interface Unit   ',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'This is provided in VDR only where external sensors are interfaced to VDR via this unit\n',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    Text(
                      '5.	Final Recording Module (Protected storage unit) ',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'This is a crash-proof, tamper-proof, pressure-tight, fir resistant storage medium used to store the VDR Data. It is in the form of a capsule resistant to shock, fire, immersion and deep sea pressure. It is mounted as a fixed retrievable and/or float-free unit in an open location on the Compass Deck or Bridge Wing. It is also fitted with a device to aid the location for retrieval purpose. This unit is recovered following an incident and the recorded data is used for investigation.\n',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    Text(
                      '6.	Replay Module  ',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'It is an optional module and used to download and replay the saved information in audio visual form\n',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),


                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FullScreenImagePage(imagePath: 'images/fun1/vdr_block.png',)),
                        );
                      },
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'images/fun1/vdr_block.png',
                              fit: BoxFit.cover,
                              height: 220,
                            ),
                          ),
                          const SizedBox(height: 8), // Spacing between image and text
                          Center(
                            child: Text(
                              'Block Diagram - VDR',
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FullScreenImagePage(imagePath: 'images/fun1/vdr_process.jpg',)),
                        );
                      },
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'images/fun1/vdr_process.jpg',
                              fit: BoxFit.cover,
                              height:330,
                            ),
                          ),
                          const SizedBox(height: 8), // Spacing between image and text
                          Center(
                            child: Text(
                              'Diagram - VDR\n',
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
                      'VDR vs S-VDR (Data Recorded)\n',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                Table(
                  border: TableBorder.all(color: Colors.white54),
                  columnWidths: const {
                    0: FlexColumnWidth(1), // Column 1 width
                    1: FlexColumnWidth(1), // Column 2 width
                  },
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'VDR',
                              style: GoogleFonts.playfairDisplay(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'S-VDR',
                              style: GoogleFonts.playfairDisplay(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    _buildTableRow('Date, Time and Position (GPS)', 'Date, Time and Position (GPS)'),
                    _buildTableRow('Speed (Log)', 'Speed (Log or GPS)'),
                    _buildTableRow('Heading (Gyro)', 'Heading (Gyro)'),
                    _buildTableRow('Bridge and VHF Audio', 'Bridge and VHF Audio'),
                    _buildTableRow('Radar Display Image', 'Radar Display Image or only AIS Data'),
                    _buildTableRow('ECDIS', 'Any other NMEA format data'),
                    _buildTableRow('AIS Data', ''),
                    _buildTableRow('Depth (Echo-Sounder)', ''),
                    _buildTableRow('Bridge Mandatory Alarms', ''),
                    _buildTableRow('Rudder Order & Response', ''),
                    _buildTableRow('Engine & Thruster Order & Response', ''),
                    _buildTableRow('Hull Opening Status, W/T & Fire Doors status', ''),
                    _buildTableRow('Acceleration and Hull Stresses, Rolling Motion', ''),
                    _buildTableRow('Wind Direction and Speed', ''),
                    _buildTableRow('Configuration Data', ''),
                    _buildTableRow('Electronic Log Book (if used)', ''),
                  ],

                ),
                    const SizedBox(height: 20),
                    Text(
                      'Working  ',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '•	The VDR is fully automatic and works even when the vessel is alongside.\n'
                      '•	It works for almost 2 hours following a power failure and is alarm protected in the event of malfunction of any of its elements.\n'
                    '•	If there is no manual intervention, the recorder data gets overwritten within 12 hours (or 48 hours) and thus will not be available to investigators. Hence, after an incident, the SAVE button must be pressed in order to save the useful information that can be used to build up an accurate picture of the events preceding an incident.\n',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Benefits  ',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '• Accident investigation\n'
                      '•	Performance monitoring & Promotion of safe practices\n'
                    '•	Response assessment and study\n'
                    '•	Training aid and support\n'
                    '•	Reduction in insurance cost\n'
                    '•	Heavy weather damage analysis\n'
                    '•	Statistics generation\n',

                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Ownership & Recovery',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '•	The shipowner owns the VDR and its data. However, in case of an incident, the shipowner shall make arrangements for the recovery of the recorded information.\n'
                      '•	The shipowner is responsible for ensuring preservation of this evidence.\n'
                      '•	In case of abandonment, Master’s should, where possible, take steps to preserve the VDR information until it can be passed to an investigator.\n'
                    '•	During the course of an investigation, the investigator will have custody of the original VDR information. The investigator is responsible for arranging for the downloading and read out of information and must keep the shipowner fully informed at the earliest.\n'
                    '•	A copy of the VDR information must be provided to the shipowner at an early stage in all circumstances.\n\n\n\n',

                      style: const TextStyle(
                        color: Colors.white70,
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

