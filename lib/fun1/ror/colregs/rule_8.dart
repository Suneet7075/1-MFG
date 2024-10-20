import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule8 extends StatefulWidget {
  const Rule8({super.key});

  @override
  _Rule8State createState() => _Rule8State();
}

class _Rule8State extends State<Rule8> {
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
          'Rule 8',
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
                      'Action to Avoid Collision',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildParagraph(
                      '(a) Any action to avoid collision shall be taken in accordance with the Rules of this Part and shall, if the '
                          'circumstances of the case admit, be positive, made in ample time and with due regard to the observance of good seamanship.\n\n'
                          '(b) Any alteration of course and/or speed to avoid collision, shall, if the circumstances of the case admit, be large enough '
                          'to be readily apparent to another vessel observing visually or by radar; a succession of small alterations of course and/or '
                          'speed should be avoided.\n\n'
                          '(c) If there is sufficient sea room, alteration of course alone may be the most effective action to avoid a close-quarters '
                          'situation provided that it is made in good time, is substantial and does not result in another close-quarters situation.\n\n'
                          '(d) Action taken to avoid collision with another vessel shall be such as to result in passing at a safe distance. The '
                          'effectiveness of the action shall be carefully checked until the other vessel is finally past and clear.\n\n'
                          '(e) If necessary to avoid collision or allow more to assess the situation, a vessel shall slacken her speed or take all way off by '
                          'stopping or reversing her means of propulsion.\n\n'
                          '(f) (i) A vessel which, by any of these Rules, is required not to impede the passage or safe passage of another vessel shall, when '
                          'required by the circumstances of the case, take early action to allow sufficient sea room for the safe passage of the other vessel.\n\n'
                          '(ii) A vessel required not to impede the passage or safe passage of another vessel is not relieved of this obligation if '
                          'approaching the other vessel so as to involve risk of collision and shall, when taking action, have full regard to the action which '
                          'may be required by the Rules of this part.\n\n'
                          '(iii) A vessel the passage of which is not to be impeded remains fully obliged to comply with the rules of this part when the two vessels '
                          'are approaching one another so as to involve risk of collision.',
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
