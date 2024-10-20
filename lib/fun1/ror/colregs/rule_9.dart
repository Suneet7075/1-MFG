import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule9 extends StatefulWidget {
  const Rule9({super.key});

  @override
  _Rule9State createState() => _Rule9State();
}

class _Rule9State extends State<Rule9> {
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
          'Rule 9',
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
                      'Narrow Channels',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildParagraph(
                      '(a) A vessel proceeding along the course of a narrow channel or fairway shall keep as near to the outer limit of the channel or '
                          'fairway which lies on her starboard side as is safe and practicable.\n\n'
                          '(b) A vessel of less than 20 metres in length or a sailing vessel shall not impede the passage of a vessel which can safely navigate only '
                          'within a narrow channel or fairway.\n\n'
                          '(c) A vessel engaged in fishing shall not impede the passage of any other vessel navigating within a narrow channel or fairway.\n\n'
                          '(d) A vessel shall not cross a narrow channel or fairway if such crossing impedes the passage of a vessel which can safely navigate '
                          'only within such channel or fairway. The latter vessel may use the sound signal prescribed in Rule 34(d) if in doubt as to the intention '
                          'of the crossing vessel.\n\n'
                          '(e) (i) In a narrow channel or fairway when overtaking can take place only if the vessel to be overtaken has to take action to permit safe '
                          'passing, the vessel intending to overtake shall indicate her intention by sounding the appropriate signal prescribed in Rule 34(c)(i). '
                          'The vessel to be overtaken shall, if in agreement, sound the appropriate signal prescribed in Rule 34(c)(ii) and take steps to permit '
                          'safe passing. If in doubt she may sound the signals prescribed in Rule 34(d).\n\n'
                          '(ii) This Rule does not relieve the overtaking vessel of her obligation under Rule 13.\n\n'
                          '(f) A vessel nearing a bend or an area of a narrow channel or fairway where other vessels may be obscured by an intervening obstruction shall '
                          'navigate with particular alertness and caution and shall sound the appropriate signal prescribed in Rule 34(e).\n\n'
                          '(g) Any vessel shall, if the circumstances of the case admit, avoid anchoring in a narrow channel.',
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
