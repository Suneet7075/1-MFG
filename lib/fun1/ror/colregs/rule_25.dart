import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule25 extends StatefulWidget {
  const Rule25({super.key});

  @override
  _Rule25State createState() => _Rule25State();
}

class _Rule25State extends State<Rule25> {
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
          'Rule 25',
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
                      'Sailing Vessels Underway and Vessels under Oars',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildVisibilitySection(
                      'a) A sailing vessel underway shall exhibit:',
                      [
                        'i) Sidelights;',
                        'ii) A sternlight.',
                      ],
                    ),
                    _buildVisibilitySection(
                      'b) In a sailing vessel of less than 20 metres in length the lights prescribed in paragraph (a) of this Rule may be combined in one lantern carried at or near the top of the mast where it can best be seen.',
                      [],
                    ),
                    _buildVisibilitySection(
                      'c) A sailing vessel underway may, in addition to the lights prescribed in paragraph (a) of this Rule, exhibit at or near the top of the mast, where they can best be seen, two all-round lights in a vertical line, the upper being red and the lower green, but these lights shall not be exhibited in conjunction with the combined lantern permitted by paragraph (b) of this Rule.',
                      [],
                    ),
                    _buildVisibilitySection(
                      'd) (i) A sailing vessel of less than 7 metres in length shall, if practicable, exhibit the lights prescribed in paragraph (a) or (b) of this Rule, but if she does not, she shall have ready at hand an electric torch or lighted lantern showing a white light which shall be exhibited in sufficient time to prevent collision.',
                      [
                        'ii) A vessel under oars may exhibit the lights prescribed in this Rule for sailing vessels, but if she does not, she shall have ready at hand an electric torch or lighted lantern showing a white light which shall be exhibited in sufficient time to prevent collision.',
                      ],
                    ),
                    _buildVisibilitySection(
                      'e) A vessel proceeding under sail when also being propelled by machinery shall exhibit forward where it can best be seen a conical shape, apex downwards.',
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
