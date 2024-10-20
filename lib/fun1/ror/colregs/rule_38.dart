import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule38 extends StatefulWidget {
  const Rule38({super.key});

  @override
  _Rule38State createState() => _Rule38State();
}

class _Rule38State extends State<Rule38> {
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
          'Rule 38',
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
                      'Exemptions',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Any vessel (or class of vessels) provided that she complies with the requirements of the International Regulations for Preventing Collisions at Sea, 1960, the keel of which is laid or which is at a corresponding stage of construction before the entry into force of these Regulations may be exempted from compliance therewith as follows:',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '(a) The installation of lights with ranges prescribed in Rule 22, until four years after the date of entry into force of these Regulations.',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      '(b) The installation of lights with colour specifications as prescribed in Section 7 of Annex I to these Regulations, until four years after the date of entry into force of these Regulations.',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      '(c) The repositioning of lights as a result of conversion from Imperial to metric units and rounding off measurement figures, permanent exemption.',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      '(d) (i) The repositioning of masthead lights on vessels of less than 150 meters in length, resulting from the prescriptions of Section 3(a) of Annex I to these Regulations, permanent exemption.\n(ii) The repositioning of masthead lights on vessels of 150 meters or more in length, resulting from the prescriptions of Section 3(a) of Annex I to these Regulations, until nine years after the date of entry into force of these Regulations.',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      '(e) The repositioning of masthead lights resulting from the prescriptions of Section 2(b) of Annex I to these Regulations, until nine years after the date of entry into force of these Regulations.',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      '(f) The repositioning of sidelights resulting from the prescriptions of Sections 2(g) and 3(b) of Annex I to these Regulations, until nine years after the date of entry into force of these Regulations.',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      '(g) The requirements for sound signal appliances prescribed in Annex III to these regulations, until nine years after the date of entry into force of these Regulations.',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      '(h) The repositioning of all-round lights resulting from the prescription of Section 9(b) of Annex I to these Regulations, permanent exemption.',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
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
