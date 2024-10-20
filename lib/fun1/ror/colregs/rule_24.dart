import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule24 extends StatefulWidget {
  const Rule24({super.key});

  @override
  _Rule24State createState() => _Rule24State();
}

class _Rule24State extends State<Rule24> {
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
          'Rule 24',
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
                      'Towing and Pushing',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildVisibilitySection(
                      'a) A power-driven vessel when towing shall exhibit:',
                      [
                        'i) Instead of the light prescribed in Rule 23(a)(i) or (a)(ii), two masthead lights in a vertical line. When the length of the tow, measuring from the stern of the towing vessel to the after end of the tow exceeds 200 metres, three such lights in a vertical line;',
                        'ii) Sidelights;',
                        'iii) A sternlight;',
                        'iv) A towing light in a vertical line above the sternlight;',
                        'v) When the length of the tow exceeds 200 metres, a diamond shape where it can best be seen.',
                      ],
                    ),
                    _buildVisibilitySection(
                      'b) When a pushing vessel and a vessel being pushed ahead are rigidly connected in a composite unit they shall be regarded as a power-driven vessel and exhibit the lights prescribed in Rule 23.',
                      [],
                    ),
                    _buildVisibilitySection(
                      'c) A power-driven vessel when pushing ahead or towing alongside, except in the case of a composite unit, shall exhibit:',
                      [
                        'i) Instead of the light prescribed in Rule 23(a)(i) or (a)(ii), two masthead lights in a vertical line;',
                        'ii) Sidelights;',
                        'iii) A sternlight.',
                      ],
                    ),
                    _buildVisibilitySection(
                      'd) A power-driven vessel to which paragraph (a) or (c) of this Rule applies shall also comply with Rule 23(a)(ii).',
                      [],
                    ),
                    _buildVisibilitySection(
                      'e) A vessel or object being towed, other than those mentioned in paragraph (g) of this Rule, shall exhibit:',
                      [
                        'i) Sidelights;',
                        'ii) A sternlight;',
                        'iii) When the length of the tow exceeds 200 metres, a diamond shape where it can best be seen.',
                      ],
                    ),
                    _buildVisibilitySection(
                      'f) Provided that any number of vessels being towed alongside or pushed in a group shall be lighted as one vessel:',
                      [
                        'i) A vessel being pushed ahead, not being part of a composite unit, shall exhibit at the forward end, sidelights;',
                        'ii) A vessel being towed alongside shall exhibit a sternlight and at the forward end, sidelights.',
                      ],
                    ),
                    _buildVisibilitySection(
                      'g) An inconspicuous, partly submerged vessel or object, or combination of such vessels or objects being towed, shall exhibit:',
                      [
                        'i) If it is less than 25 metres in breadth, one all-round white light at or near the forward end and one at or near the after end except that dracones need not exhibit a light at or near the forward end;',
                        'ii) If it is 25 metres or more in breadth, two additional all-round white lights at or near the extremities of its breadth;',
                        'iii) If it exceeds 100 metres in length, additional all-round white lights between the lights prescribed in sub-paragraphs (i) and (ii) so that the distance between the lights shall not exceed 100 metres;',
                        'iv) A diamond shape at or near the after most extremity of the last vessel or object being towed and if the length of the tow exceeds 200 metres an additional diamond shape where it can best be seen and located as far forward as is practicable.',
                      ],
                    ),
                    _buildVisibilitySection(
                      'h) Where from any sufficient cause it is impracticable for a vessel or object being towed to exhibit the lights or shapes prescribed in paragraph (e) or (g) of this Rule, all possible measures shall be taken to light the vessel or object towed or at least to indicate the presence of such vessel or object.',
                      [],
                    ),
                    _buildVisibilitySection(
                      'i) Where from any sufficient cause it is impracticable for a vessel not normally engaged in towing operations to display the lights prescribed in paragraph (a) or (c) of this Rule, such vessel shall not be required to exhibit those lights when engaged in towing another vessel in distress or otherwise in need of assistance. All possible measures shall be taken to indicate the nature of the relationship between the towing vessel and the vessel being towed as authorized by Rule 36, in particular by illuminating the towline.',
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
