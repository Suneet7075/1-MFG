import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule3 extends StatefulWidget {
  const Rule3({super.key});

  @override
  _Rule3State createState() => _Rule3State();
}

class _Rule3State extends State<Rule3> {
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
          'Rule 3',
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
                      'General Definitions',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildParagraph(
                      'For the purpose of these Rules, except where the context otherwise requires:\n\n'
                          'a. The word "vessel" includes every description of water craft, including non-displacement craft, WIG craft and seaplanes, used or capable of being used as a means of transportation on water.\n\n'
                          'b. The term "power-driven vessel" means any vessel propelled by machinery.\n\n'
                          'c. The term "sailing vessel" means any vessel under sail provided that propelling machinery, if fitted, is not being used.\n\n'
                          'd. The term "vessel engaged in fishing" means any vessel fishing with nets, lines, trawls or other fishing apparatus which restrict manoeuvrability, but does not include a vessel fishing with trolling lines or other fishing apparatus which do not restrict manoeuvrability.\n\n'
                          'e. The word "seaplane" includes any aircraft designed to manoeuvre on the water.\n\n'
                          'f. The term "vessel not under command" means a vessel which through some exceptional circumstance is unable to manoeuvre as required by these Rules and is therefore unable to keep out of the way of another vessel.\n\n'
                          'g. The term "vessel restricted in her ability to manoeuvre" means a vessel which from the nature of her work is restricted in her ability to manoeuvre as required by these Rules and is therefore unable to keep out of the way of another vessel. The term "vessels restricted in their ability to manoeuvre" shall include but not be limited to:\n'
                          '1. a vessel engaged in laying, servicing or picking up a navigation mark, submarine cable or pipeline;\n'
                          '2. a vessel engaged in dredging, surveying or underwater operations;\n'
                          '3. a vessel engaged in replenishment or transferring persons, provisions or cargo while underway;\n'
                          '4. a vessel engaged in the launching or recovery of aircraft;\n'
                          '5. a vessel engaged in mine clearance operations;\n'
                          '6. a vessel engaged in a towing operation such as severely restricts the towing vessel and her tow in their ability to deviate from their course.\n\n'
                          'h. The term "vessel constrained by her draught" means a power-driven vessel which, because of her draught in relation to the available depth and width of navigable water, is severely restricted in her ability to deviate from the course she is following.\n\n'
                          'i. The word "underway" means that a vessel is not at anchor, or made fast to the shore, or aground.\n\n'
                          'j. The words "length" and "breadth" of a vessel mean her length overall and greatest breadth.\n\n'
                          'k. Vessels shall be deemed to be in sight of one another only when one can be observed visually from the other.\n\n'
                          'l. The term "restricted visibility" means any condition in which visibility is restricted by fog, mist, falling snow, heavy rainstorms, sandstorms or any other similar causes.\n\n'
                          'm. The term "Wing-in-Ground (WIG) craft" means a multimodal craft which, in its main operational mode, flies in close proximity to the surface by utilizing surface-effect action.\n\n\n\n',
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
