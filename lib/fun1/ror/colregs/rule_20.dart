import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule20 extends StatefulWidget {
  const Rule20({super.key});

  @override
  _Rule20State createState() => _Rule20State();
}

class _Rule20State extends State<Rule20> {
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
          'Rule 20',
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
                      'Application',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildParagraph(
                      '(a) Rules in this Part shall be complied with in all weathers.\n\n'
                          '(b) The Rules concerning lights shall be complied with from sunset to sunrise, and during such times no other lights shall be exhibited, except such lights as cannot be mistaken for the lights specified in these Rules or do not impair their visibility or distinctive character, or interfere with the keeping of a proper look-out.\n\n'
                          '(c) The lights prescribed by these Rules shall, if carried, also be exhibited from sunrise to sunset in restricted visibility and may be exhibited in all other circumstances when it is deemed necessary.\n\n'
                          '(d) The Rules concerning shapes shall be complied with by day.\n\n'
                          '(e) The lights and shapes specified in these Rules shall comply with the provisions of Annex I to these Regulations.',
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
