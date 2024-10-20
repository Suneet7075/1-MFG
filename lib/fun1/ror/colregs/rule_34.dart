import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule34 extends StatefulWidget {
  const Rule34({super.key});

  @override
  _Rule34State createState() => _Rule34State();
}

class _Rule34State extends State<Rule34> {
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
          'Rule 34',
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
                      'Manoeuvring and Warning Signals',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'When vessels are in sight of one another, a power-driven vessel underway, when manoeuvring as authorized or required by these Rules, shall indicate that manoeuvre by the following signals on her whistle:',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '- one short blast to mean "I am altering my course to starboard";\n'
                          '- two short blasts to mean "I am altering my course to port";\n'
                          '- three short blasts to mean "I am operating astern propulsion".',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Any vessel may supplement the whistle signals prescribed in paragraph (a) of this Rule by light signals, repeated as appropriate, whilst the manoeuvre is being carried out:',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '1. These light signals shall have the following significance:\n'
                          '- one flash to mean "I am altering my course to starboard";\n'
                          '- two flashes to mean "I am altering my course to port";\n'
                          '- three flashes to mean "I am operating astern propulsion";\n'
                          '2. The duration of each flash shall be about one second, the interval between flashes shall be about one second, and the interval between successive signals shall be not less than ten seconds;\n'
                          '3. The light used for these signals shall, if fitted, be an all-round white light, visible at a minimum range of 5 miles and shall comply with the provisions of Annex I to these Regulations.',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'When in sight of one another in a narrow channel or fairway:',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '1. A vessel intending to overtake another shall in compliance with Rule 9(e)(i) indicate her intention by the following signals on her whistle:\n'
                          '- two prolonged blasts followed by one short blast to mean "I intend to overtake you on your starboard side";\n'
                          '- two prolonged blasts followed by two short blasts to mean "I intend to overtake you on your port side";\n'
                          '2. The vessel about to be overtaken when acting in accordance with Rule 9(e)(i) shall indicate her agreement by the following signal on her whistle:\n'
                          '- one prolonged, one short, one prolonged and one short blast, in that order.',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'When vessels in sight of one another are approaching each other and from any cause either vessel fails to understand the intentions or actions of the other, or is in doubt whether sufficient action is being taken by the other to avoid collision, the vessel in doubt shall immediately indicate such doubt by giving at least five short and rapid blasts on the whistle. Such signal may be supplemented by a light signal of at least five short and rapid flashes.',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'A vessel nearing a bend or an area of a channel or fairway where other vessels may be obscured by an intervening obstruction shall sound one prolonged blast. Such signal shall be answered with a prolonged blast by any approaching vessel that may be within hearing around the bend or behind the intervening obstruction.',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'If whistles are fitted on a vessel at a distance apart of more than 100 metres, one whistle only shall be used for giving manoeuvring and warning signals.',
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
