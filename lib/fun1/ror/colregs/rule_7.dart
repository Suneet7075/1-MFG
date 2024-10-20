import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule7 extends StatefulWidget {
  const Rule7({super.key});

  @override
  _Rule7State createState() => _Rule7State();
}

class _Rule7State extends State<Rule7> {
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
          'Rule 7',
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
                      'Risk of Collision',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildParagraph(
                      '(a) Every vessel shall use all available means appropriate to the prevailing circumstances and conditions '
                          'to determine if risk of collision exists. If there is any doubt such risk shall be deemed to exist.\n\n'
                          '(b) Proper use shall be made of radar equipment if fitted and operational, including long-range scanning '
                          'to obtain early warning of risk of collision and radar plotting or equivalent systematic observation of detected objects.\n\n'
                          '(c) Assumptions shall not be made on the basis of scanty information, especially scanty radar information.\n\n'
                          '(d) In determining if risk of collision exists the following considerations shall be among those taken into account:\n'
                          '(i) Such risk shall be deemed to exist if the compass bearing of an approaching vessel does not appreciably change;\n'
                          '(ii) Such risk may sometimes exist even when an appreciable bearing change is evident, particularly when approaching '
                          'a very large vessel or a tow or when approaching a vessel at close range.',
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
