import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule35 extends StatefulWidget {
  const Rule35({super.key});

  @override
  _Rule35State createState() => _Rule35State();
}

class _Rule35State extends State<Rule35> {
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
          'Rule 35',
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
                      'Sound Signals in Restricted Visibility',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'In or near an area of restricted visibility, whether by day or night, the signals prescribed in this Rule shall be used as follows:',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'a) A power-driven vessel making way through the water shall sound at intervals of not more than 2 minutes one prolonged blast.\n'
                          'b) A power-driven vessel underway but stopped and making no way through the water shall sound at intervals of not more than 2 minutes two prolonged blasts in succession with an interval of about 2 seconds between them.\n'
                          'c) A vessel not under command, a vessel restricted in her ability to manoeuvre, a vessel constrained by her draught, a sailing vessel, a vessel engaged in fishing and a vessel engaged in towing or pushing another vessel shall, instead of the signals prescribed in paragraphs (a) or (b) of this Rule sound at intervals of not more than 2 minutes three blasts in succession, namely one prolonged followed by two short blasts.\n'
                          'd) A vessel engaged in fishing, when at anchor, and a vessel restricted in her ability to manoeuvre when carrying out her work at anchor, shall instead of the signals prescribed in paragraph (g) of this Rule sound the signal prescribed in paragraph (c) of this Rule.\n'
                          'e) A vessel towed or if more than one vessel is towed the last vessel of the tow, if manned, shall at intervals of not more than 2 minutes sound four blasts in succession, namely one prolonged followed by three short blasts. When practicable, this signal shall be made immediately after the signal made by the towing vessel.\n'
                          'f) When a pushing vessel and a vessel being pushed ahead are rigidly connected in a composite unit they shall be regarded as a power-driven vessel and shall give the signals prescribed in paragraphs (a) or (b) of this Rule.\n'
                          'g) A vessel at anchor shall at intervals of not more than one minute ring the bell rapidly for about 5 seconds. In a vessel of 100 metres or more in length the bell shall be sounded in the forepart of the vessel and immediately after the ringing of the bell the gong shall be sounded rapidly for about 5 seconds in the after part of the vessel. A vessel at anchor may in addition sound three blasts in succession, namely one short, one prolonged and one short blast, to give warning of her position and of the possibility of collision to an approaching vessel.\n'
                          'h) A vessel aground shall give the bell signal and if required the gong signal prescribed in paragraph (g) of this Rule and shall, in addition, give three separate and distinct strokes on the bell immediately before and after the rapid ringing of the bell. A vessel aground may in addition sound an appropriate whistle signal.\n'
                          'i) A vessel of 12 metres or more but less than 20 metres in length shall not be obliged to give the bell signals prescribed in paragraphs (g) and (h) of this Rule. However, if she does not, she shall make some other efficient sound signal at intervals of not more than 2 minutes.\n'
                          'j) A vessel of less than 12 metres in length shall not be obliged to give the above-mentioned signals but, if she does not, shall make some other efficient sound signal at intervals of not more than 2 minutes.\n'
                          'k) A pilot vessel when engaged on pilotage duty may in addition to the signals prescribed in paragraphs (a), (b) or (g) of this Rule sound an identity signal consisting of four short blasts.',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
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
}
