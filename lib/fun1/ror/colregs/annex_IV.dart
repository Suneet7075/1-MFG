import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnnexIV extends StatefulWidget {
  const AnnexIV({super.key});

  @override
  _AnnexIVState createState() => _AnnexIVState();
}

class _AnnexIVState extends State<AnnexIV> {
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
          'ANNEX IV',
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
                      'DISTRESS SIGNALS',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '1. The following signals, used or exhibited either together or separately, indicate distress and need of assistance:',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildSignalItem(
                      '(a)',
                      'a gun or other explosive signals fired at intervals of about a minute;',
                    ),
                    _buildSignalItem(
                      '(b)',
                      'a continuous sounding with any fog-signalling apparatus;',
                    ),
                    _buildSignalItem(
                      '(c)',
                      'rockets or shells, throwing red stars fired one at a time at short intervals;',
                    ),
                    _buildSignalItem(
                      '(d)',
                      'a signal made by any signalling method consisting of the group ... --- ... (SOS) in the Morse Code;',
                    ),
                    _buildSignalItem(
                      '(e)',
                      'a signal sent by radiotelephony consisting of the spoken word "MAYDAY";',
                    ),
                    _buildSignalItem(
                      '(f)',
                      'the International Code Signal of distress indicated by N.C.;',
                    ),
                    _buildSignalItem(
                      '(g)',
                      'a signal consisting of a square flag having above or below it a ball or anything resembling a ball;',
                    ),
                    _buildSignalItem(
                      '(h)',
                      'flames on the vessel (as from a burning tar barrel, oil barrel, etc.);',
                    ),
                    _buildSignalItem(
                      '(i)',
                      'a rocket parachute flare or a hand-flare showing a red light;',
                    ),
                    _buildSignalItem(
                      '(j)',
                      'a smoke signal giving off orange-coloured smoke;',
                    ),
                    _buildSignalItem(
                      '(k)',
                      'slowly and repeatedly raising and lowering arms outstretched to each side;',
                    ),
                    _buildSignalItem(
                      '(l)',
                      'a distress alert by means of digital selective calling (DSC) transmitted on:',
                    ),
                    _buildIndentedSignalItem(
                      '(i)',
                      'VHF channel 70, or',
                    ),
                    _buildIndentedSignalItem(
                      '(ii)',
                      'MF/HF on the frequencies 2187.5 kHz, 8414.5 kHz, 4207.5 kHz, 6312 kHz, 12577 kHz or 16804.5 kHz;',
                    ),
                    _buildSignalItem(
                      '(m)',
                      'a ship-to-shore distress alert transmitted by the ship’s Inmarsat or other mobile satellite service provider ship earth station;',
                    ),
                    _buildSignalItem(
                      '(n)',
                      'signals transmitted by emergency position-indicating radio beacons;',
                    ),
                    _buildSignalItem(
                      '(o)',
                      'approved signals transmitted by radiocommunications systems, including survival craft radar transponders;',
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '2. The use or exhibition of any of the foregoing signals, except for the purpose of indicating distress and need of assistance and the use of other signals which may be confused with any of the above signals, is prohibited.',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '3. Attention is drawn to the relevant sections of the International Code of Signals, the International Aeronautical and Maritime Search and Rescue Manual, Volume III and the following signals:',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildSignalItem(
                      '(a)',
                      'a piece of orange-coloured canvas with either a black square and circle or other appropriate symbol (for identification from the air);',
                    ),
                    _buildSignalItem(
                      '(b)',
                      'a dye marker.',
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

  Widget _buildSignalItem(String code, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            code,
            style: const TextStyle(
              color: Colors.white60,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 18,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndentedSignalItem(String code, String description) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            code,
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 18,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
