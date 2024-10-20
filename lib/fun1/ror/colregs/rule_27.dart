import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule27 extends StatefulWidget {
  const Rule27({super.key});

  @override
  _Rule27State createState() => _Rule27State();
}

class _Rule27State extends State<Rule27> {
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
          'Rule 27',
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
                      'Vessels not under Command or Restricted in their Ability to Manoeuvre',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildVisibilitySection(
                      'a) A vessel not under command shall exhibit:',
                      [
                        'i) Two all-round red lights in a vertical line where they can best be seen;',
                        'ii) Two balls or similar shapes in a vertical line where they can best be seen;',
                        'iii) When making way through the water, in addition to the lights prescribed in this paragraph, sidelights and a sternlight.',
                      ],
                    ),
                    _buildVisibilitySection(
                      'b) A vessel restricted in her ability to manoeuvre, except a vessel engaged in mineclearance operations, shall exhibit:',
                      [
                        'i) Three all-round lights in a vertical line where they can best be seen. The highest and lowest of these lights shall be red and the middle light shall be white;',
                        'ii) Three shapes in a vertical line where they can best be seen. The highest and lowest of these shapes shall be balls and the middle one a diamond;',
                        'iii) When making way through the water, a masthead light or lights, sidelights and a sternlight in addition to the lights prescribed in sub-paragraph (i);',
                        'iv) When at anchor, in addition to the lights or shapes prescribed in sub-paragraphs (i) and (ii), the light, lights or shape prescribed in Rule 30.',
                      ],
                    ),
                    _buildVisibilitySection(
                      'c) A power-driven vessel engaged in a towing operation such as severely restricts the towing vessel and her tow in their ability to deviate from their course shall, in addition to the lights or shapes prescribed in Rule 24(a), exhibit the lights or shapes prescribed in sub-paragraphs (b)(i) and (ii) of this Rule.',
                      [],
                    ),
                    _buildVisibilitySection(
                      'd) A vessel engaged in dredging or underwater operations, when restricted in her ability to manoeuvre, shall exhibit the lights and shapes prescribed in sub-paragraphs (b) (i), (ii) and (iii) of this Rule and shall in addition, when an obstruction exists, exhibit:',
                      [
                        'i) Two all-round red lights or two balls in a vertical line to indicate the side on which the obstruction exists;',
                        'ii) Two all-round green lights or two diamonds in a vertical line to indicate the side on which another vessel may pass;',
                        'iii) When at anchor, the lights or shapes prescribed in this paragraph instead of the lights or shape prescribed in Rule 30.',
                      ],
                    ),
                    _buildVisibilitySection(
                      'e) Whenever the size of a vessel engaged in diving operations makes it impracticable to exhibit all lights and shapes prescribed in paragraph (d) of this Rule, the following shall be exhibited:',
                      [
                        'i) Three all-round lights in a vertical line where they can best be seen. The highest and lowest of these lights shall be red and the middle light shall be white;',
                        'ii) A rigid replica of the International Code flag "A" not less than 1 metre in height. Measures shall be taken to ensure its all-round visibility.',
                      ],
                    ),
                    _buildVisibilitySection(
                      'f) A vessel engaged in mineclearance operations shall in addition to the lights prescribed for a power-driven vessel in Rule 23 or to the lights or shape prescribed for a vessel at anchor in Rule 30 as appropriate, exhibit three all-round green lights or three balls. One of these lights or shapes shall be exhibited near the foremast head and one at each end of the fore yard. These lights or shapes indicate that it is dangerous for another vessel to approach within 1000 metres of the mineclearance vessel.',
                      [],
                    ),
                    _buildVisibilitySection(
                      'g) Vessels of less than 12 metres in length, except those engaged in diving operations, shall not be required to exhibit the lights and shapes prescribed in this Rule.',
                      [],
                    ),
                    _buildVisibilitySection(
                      'h) The signals prescribed in this Rule are not signals of vessels in distress and requiring assistance. Such signals are contained in Annex IV to these Regulations.',
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
