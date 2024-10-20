import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule18 extends StatefulWidget {
  const Rule18({super.key});

  @override
  _Rule18State createState() => _Rule18State();
}

class _Rule18State extends State<Rule18> {
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
          'Rule 18',
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
                      'Responsibilities between Vessels',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildParagraph(
                      'Except where Rules 9, 10 and 13 otherwise require:\n\n'
                          '(a) A power-driven vessel underway shall keep out of the way of:\n'
                          '(i) a vessel not under command;\n'
                          '(ii) a vessel restricted in her ability to manoeuvre;\n'
                          '(iii) a vessel engaged in fishing;\n'
                          '(iv) a sailing vessel.\n\n'
                          '(b) A sailing vessel underway shall keep out of the way of:\n'
                          '(i) a vessel not under command;\n'
                          '(ii) a vessel restricted in her ability to manoeuvre;\n'
                          '(iii) a vessel engaged in fishing.\n\n'
                          '(c) A vessel engaged in fishing when underway shall, so far as possible, keep out of the way of:\n'
                          '(i) a vessel not under command;\n'
                          '(ii) a vessel restricted in her ability to manoeuvre.\n\n'
                          '(d)\n'
                          '(i) Any vessel other than a vessel not under command or a vessel restricted in her ability to manoeuvre shall, if the circumstances of the case admit, avoid impeding the safe passage of a vessel constrained by her draught, exhibiting the signals in Rule 28.\n'
                          '(ii) A vessel constrained by her draught shall navigate with particular caution having full regard to her special condition.\n\n'
                          '(e)\n'
                          '(i) A seaplane on the water shall, in general, keep well clear of all vessels and avoid impeding their navigation. In circumstances, however, where risk of collision exists, she shall comply with the Rules of this Part.\n\n'
                          '(f)\n'
                          '(i) A WIG craft shall, when taking off, landing and in flight near the surface, keep well clear of all other vessels and avoid impeding their navigation;\n'
                          '(ii) a WIG craft operating on the water surface shall comply with the Rules of this Part as a power-driven vessel.',
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
