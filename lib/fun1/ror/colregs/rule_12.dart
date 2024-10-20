import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule12 extends StatefulWidget {
  const Rule12({super.key});

  @override
  _Rule12State createState() => _Rule12State();
}

class _Rule12State extends State<Rule12> {
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
          'Rule 12',
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
                      'Sailing Vessels',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildParagraph(
                      '(a) When two sailing vessels are approaching one another, so as to involve risk of collision, one of them shall keep out of the way of the other as follows:',
                    ),
                    _buildSubParagraph(
                      '(i) when each has the wind on a different side, the vessel which has the wind on the port side shall keep out of the way of the other;',
                    ),
                    _buildSubParagraph(
                      '(ii) when both have the wind on the same side, the vessel which is to windward shall keep out of the way of the vessel which is to leeward;',
                    ),
                    _buildSubParagraph(
                      '(iii) if a vessel with the wind on the port side sees a vessel to windward and cannot determine with certainty whether the other vessel has the wind on the port or on the starboard side, she shall keep out of the way of the other.',
                    ),
                    _buildParagraph(
                      '(b) For the purposes of this Rule, the windward side shall be deemed to be the side opposite to that on which the mainsail is carried or, in the case of a square-rigged vessel, the side opposite to that on which the largest fore-and-aft sail is carried.',
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

  Widget _buildSubParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 18,
          height: 1.5,
        ),
      ),
    );
  }
}
