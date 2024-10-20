import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule23 extends StatefulWidget {
  const Rule23({super.key});

  @override
  _Rule23State createState() => _Rule23State();
}

class _Rule23State extends State<Rule23> {
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
          'Rule 23',
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
                      'Power-driven Vessels Underway',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildVisibilitySection(
                      'a) A power-driven vessel underway shall exhibit:',
                      [
                        'i) a masthead light forward;',
                        'ii) a second masthead light abaft of and higher than the forward one; except that a vessel of less than 50 meters in length shall not be obliged to exhibit such light but may do so;',
                        'iii) sidelights;',
                        'iv) a sternlight.',
                      ],
                    ),
                    _buildVisibilitySection(
                      'b) An air-cushion vessel when operating in the non-displacement mode shall, in addition to the lights prescribed in paragraph (a) of this Rule exhibit an all-round flashing yellow light.',
                      [],
                    ),
                    _buildVisibilitySection(
                      'c) A WIG craft only when taking off, landing and in flight near the surface shall, in addition to the lights prescribed in paragraph (a) of this Rule, exhibit a high intensity all-round flashing red light.',
                      [],
                    ),
                    _buildVisibilitySection(
                      'd) The following applies to power-driven vessels of less than 12 meters in length:',
                      [
                        'i) A power-driven vessel of less than 12 meters in length may in lieu of the lights prescribed in paragraph (a) of this Rule exhibit an all-round white light and sidelights;',
                        'ii) A power-driven vessel of less than 7 meters in length whose maximum speed does not exceed 7 knots may in lieu of the lights prescribed in paragraph (a) of this Rule exhibit an all-round white light and shall, if practicable, also exhibit sidelights;',
                        'iii) The masthead light or all-round white light on a power-driven vessel of less than 12 meters in length may be displaced from the fore and aft centreline of the vessel if centreline fitting is not practicable, provided that the sidelights are combined in one lantern which shall be carried on the fore and aft centreline of the vessel or located as nearly as practicable in the same fore and aft line as the masthead light or the all-round white light.',
                      ],
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

  Widget _buildVisibilitySection(String heading, List<String> details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: GoogleFonts.playfairDisplay(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        for (String detail in details)
          Text(
            detail,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 18,
              height: 1.5,
            ),
          ),
        const SizedBox(height: 20), // Space between sections
      ],
    );
  }
}
