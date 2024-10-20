import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule33 extends StatefulWidget {
  const Rule33({super.key});

  @override
  _Rule33State createState() => _Rule33State();
}

class _Rule33State extends State<Rule33> {
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
          'Rule 33',
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
                      'Equipment for Sound Signals',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'A vessel of 12 metres or more in length shall be provided with a whistle, a vessel of 20 metres or more in length shall be provided with a bell in addition to a whistle, and a vessel of 100 metres or more in length shall, in addition, be provided with a gong, the tone and sound of which cannot be confused with that of the bell. The whistle, bell and gong shall comply with the specification in Annex III to these Regulations. The bell or gong or both may be replaced by other equipment having the same respective sound characteristics, provided that manual sounding of the required signals shall always be possible.',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'A vessel of less than 12 metres in length shall not be obliged to carry the sound signalling appliances prescribed in paragraph (a) of this Rule but if she does not, she shall be provided with some other means of making an efficient sound signal.',
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
