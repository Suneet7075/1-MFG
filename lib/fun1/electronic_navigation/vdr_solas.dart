import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class VdrSolas extends StatefulWidget {
  const VdrSolas({super.key});

  @override
  _VdrSolas createState() => _VdrSolas();
}

class _VdrSolas extends State<VdrSolas> {
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
          'SOLAS Requiements',
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
                      'SOLAS REQUIREMENTS',
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
                      '•	As per SOLAS Chapter V/20, it is mandatory to have VDR fitted on the following ships when engaged on International voyages:\n\n'
                      '1.	All passenger ships and Ro-Ro Passenger ships, irrespective of date of construction\n\n'
                    '2.	Ships other than passenger ships of 3000 GT and upwards, constructed on or after 1st July 2002.\n\n'
                    '•	As per SOLAS Chapter V/20, it is mandatory to have S-VDR fitted on cargo ships of 3000 GT and upwards, constructed before 1st July 2002, when engaged on International voyages.\n\n'
                    '•	As per SOLAS Chapter V/18, the VDR, including all sensors, shall be subjected to an annual performance test. The test shall be conducted by an approved testing or servicing facility to verify the accuracy, duration and recoverability of the recorded data. In addition, it should test the devices fitted to aid location. A copy of a the certificate of compliance issued by the testing facility, stating the date of compliance and the applicable performance standards, shall be retained on board the ship.\n\n\n',
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
