import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule26 extends StatefulWidget {
  const Rule26({super.key});

  @override
  _Rule26State createState() => _Rule26State();
}

class _Rule26State extends State<Rule26> {
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
          'Rule 26',
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
                      'Fishing Vessels',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildVisibilitySection(
                      'a) A vessel engaged in fishing, whether underway or at anchor, shall exhibit only the lights and shapes prescribed in this Rule.',
                      [],
                    ),
                    _buildVisibilitySection(
                      'b) A vessel when engaged in trawling, by which is meant the dragging through the water of a dredge net or other apparatus used as a fishing appliance, shall exhibit:',
                      [
                        'i) Two all-round lights in a vertical line, the upper being green and the lower white, or a shape consisting of two cones with their apexes together in a vertical line one above the other;',
                        'ii) A masthead light abaft of and higher than the all-round green light; a vessel of less than 50 metres in length shall not be obliged to exhibit such a light but may do so;',
                        'iii) When making way through the water, in addition to the lights prescribed in this paragraph, sidelights and a sternlight.',
                      ],
                    ),
                    _buildVisibilitySection(
                      'c) A vessel engaged in fishing, other than trawling, shall exhibit:',
                      [
                        'i) Two all-round lights in a vertical line, the upper being red and the lower white, or a shape consisting of two cones with apexes together in a vertical line one above the other;',
                        'ii) When there is outlying gear extending more than 150 metres horizontally from the vessel, an all-round white light or a cone apex upwards in the direction of the gear;',
                        'iii) When making way through the water, in addition to the lights prescribed in this paragraph, sidelights and a sternlight.',
                      ],
                    ),
                    _buildVisibilitySection(
                      'd) The additional signals described in Annex II to these Regulations apply to a vessel engaged in fishing in close proximity to other vessels engaged in fishing.',
                      [],
                    ),
                    _buildVisibilitySection(
                      'e) A vessel when not engaged in fishing shall not exhibit the lights or shapes prescribed in this Rule, but only those prescribed for a vessel of her length.',
                      [],
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
