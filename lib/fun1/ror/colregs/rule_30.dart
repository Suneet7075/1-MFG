import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule30 extends StatefulWidget {
  const Rule30({super.key});

  @override
  _Rule30State createState() => _Rule30State();
}

class _Rule30State extends State<Rule30> {
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
          'Rule 30',
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
                      'Anchored Vessels and Vessels aground',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildVisibilitySection(
                      'A vessel at anchor shall exhibit where it can best be seen:',
                      [
                        'In the fore part, an all-round white light or one ball;',
                        'At or near the stern and at a lower level than the light prescribed in subparagraph (i), an all-round white light.',
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildVisibilitySection(
                      'A vessel of less than 50 metres in length may exhibit:',
                      [
                        'An all-round white light where it can best be seen instead of the lights prescribed in paragraph (a) of this Rule.',
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildVisibilitySection(
                      'A vessel at anchor may, and a vessel of 100 metres and more in length shall, also use:',
                      [
                        'The available working or equivalent lights to illuminate her decks.',
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildVisibilitySection(
                      'A vessel aground shall exhibit the lights prescribed in paragraph (a) or (b) of this Rule and in addition, where they can best be seen:',
                      [
                        'Two all-round red lights in a vertical line;',
                        'Three balls in a vertical line.',
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildVisibilitySection(
                      'A vessel of less than 7 metres in length, when at anchor, not in or near a narrow channel, fairway or anchorage, or where other vessels normally navigate, shall not be required to exhibit the lights or shape prescribed in paragraphs (a), (b) of this Rule.',
                      [],
                    ),
                    const SizedBox(height: 20),
                    _buildVisibilitySection(
                      'A vessel of less than 12 metres in length, when aground, shall not be required to exhibit the lights or shapes prescribed in sub-paragraphs (d)(i) and (ii) of this Rule.',
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
