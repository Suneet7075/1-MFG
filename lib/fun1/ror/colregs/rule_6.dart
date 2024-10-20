import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule6 extends StatefulWidget {
  const Rule6({super.key});

  @override
  _Rule6State createState() => _Rule6State();
}

class _Rule6State extends State<Rule6> {
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
          'Rule 6',
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
                      'Safe Speed',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildParagraph(
                      'Every vessel shall at all times proceed at a safe speed so that she can take proper and effective action '
                          'to avoid collision and be stopped within a distance appropriate to the prevailing circumstances and '
                          'conditions. In determining a safe speed the following factors shall be among those taken into account:\n\n'
                          '(a) By all vessels:\n'
                          '(i) the state of visibility;\n'
                          '(ii) the traffic density including concentrations of fishing vessels or any other vessels;\n'
                          '(iii) the manoeuvrability of the vessel with special reference to stopping distance and turning ability in the prevailing conditions;\n'
                          '(iv) at night the presence of background light such as from shore lights or from back scatter of her own lights;\n'
                          '(v) the state of wind, sea and current, and the proximity of navigational hazards;\n'
                          '(vi) the draught in relation to the available depth of water.\n\n'
                          '(b) Additionally, by vessels with operational radar:\n'
                          '(i) the characteristics, efficiency and limitations of the radar equipment;\n'
                          '(ii) any constraints imposed by the radar range scale in use;\n'
                          '(iii) the effect on radar detection of the sea state, weather and other sources of interference;\n'
                          '(iv) the possibility that small vessels, ice and other floating objects may not be detected by radar at an adequate range;\n'
                          '(v) the number, location and movement of vessels detected by radar;\n'
                          '(vi) the more exact assessment of the visibility that may be possible when radar is used to determine the range of vessels or other objects in the vicinity.',
                    ),
                    const SizedBox(height: 20), // Space at the bottom
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white70,
        fontSize: 18,
        height: 1.5,
      ),
    );
  }
}
