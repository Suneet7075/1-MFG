import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule10 extends StatefulWidget {
  const Rule10({super.key});

  @override
  _Rule10State createState() => _Rule10State();
}

class _Rule10State extends State<Rule10> {
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
          'Rule 10',
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
                      'Traffic Separation Schemes',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildParagraph(
                      '(a) This Rule Applies to traffic separation schemes adopted by the Organization and does not relieve '
                          'any vessel of her obligation under any other rule.\n\n'
                          '(b) A vessel using a traffic separation scheme shall:\n'
                          '(i) proceed in the appropriate traffic lane in the general direction of traffic flow for that lane;\n'
                          '(ii) so far as practicable keep clear of a traffic separation line or separation zone;\n'
                          '(iii) normally join or leave a traffic lane at the termination of the lane, but when joining or '
                          'leaving from either side shall do so at as small an angle to the general direction of traffic flow as practicable.\n\n'
                          '(c) A vessel shall so far as practicable avoid crossing traffic lanes, but if obliged to do so shall cross on '
                          'a heading as nearly as practicable at right angles to the general direction of traffic flow.\n\n'
                          '(d) (i) A vessel shall not use an inshore traffic zone when she can safely use the appropriate traffic lane within '
                          'the adjacent traffic separation scheme. However, vessels of less than 20 meters in length, sailing vessels and '
                          'vessels engaged in fishing may use the inshore traffic zone.\n'
                          '(ii) Notwithstanding subparagraph (d)(i), a vessel may use an inshore traffic zone when en route to or from a port, '
                          'offshore installation or structure, pilot station or any other place situated within the inshore traffic zone, '
                          'or to avoid immediate danger.\n\n'
                          '(e) A vessel, other than a crossing vessel, or a vessel joining or leaving a lane shall not normally enter '
                          'a separation zone or cross a separation line except:\n'
                          '(i) in cases of emergency to avoid immediate danger;\n'
                          '(ii) to engage in fishing within a separation zone.\n\n'
                          '(f) A vessel navigating in areas near the terminations of traffic separation schemes shall do so with particular caution.\n\n'
                          '(g) A vessel shall so far as practicable avoid anchoring in a traffic separation scheme or in areas near its terminations.\n\n'
                          '(h) A vessel not using a traffic separation scheme shall avoid it by as wide a margin as is practicable.\n\n'
                          '(i) A vessel engaged in fishing shall not impede the passage of any vessel following a traffic lane.\n\n'
                          '(j) A vessel of less than 20 meters in length or a sailing vessel shall not impede the safe passage of a power-driven vessel '
                          'following a traffic lane.\n\n'
                          '(k) A vessel restricted in her ability to manoeuvre when engaged in an operation for the maintenance of safety of navigation in a '
                          'traffic separation scheme is exempted from complying with this Rule to the extent necessary to carry out the operation.\n\n'
                          '(l) A vessel restricted in her ability to manoeuvre when engaged in an operation for the laying, servicing or picking up of a '
                          'submarine cable, within a traffic separation scheme, is exempted from complying with this Rule to the extent necessary to carry out '
                          'the operation.',
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
