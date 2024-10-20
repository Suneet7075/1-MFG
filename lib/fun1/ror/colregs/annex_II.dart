import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnnexII extends StatefulWidget {
  const AnnexII({super.key});

  @override
  _AnnexIIState createState() => _AnnexIIState();
}

class _AnnexIIState extends State<AnnexII> {
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
          'ANNEX II',
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
                      'ADDITIONAL SIGNALS FOR FISHING VESSELS FISHING IN CLOSE PROXIMITY',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Section 1: General
                    Text(
                      '1. General',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'The lights mentioned herein shall, if exhibited in pursuance of Rule 26(d), be placed where they can best be seen. They shall be at least 0.9 metre apart but at a lower level than lights prescribed in Rule 26(b)(i) and (c)(i). The lights shall be visible all round the horizon at a distance of at least 1 mile but at a lesser distance than the lights prescribed by these Rules for fishing vessels.',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Section 2: Signals for Trawlers
                    Text(
                      '2. Signals for trawlers',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '(a) Vessels of 20 m or more in length when engaged in trawling, whether using demersal or pelagic gear shall exhibit:',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '(i) when shooting their nets: two white lights in a vertical line;',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      '(ii) when hauling their nets: one white light over one red light in a vertical line;',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      '(iii) when the net has come fast upon an obstruction: two red lights in a vertical line.',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '(b) Each vessel of 20 m or more in length engaged in pair trawling shall exhibit:',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      '(i) by night, a searchlight directed forward and in the direction of the other vessel of the pair;',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      '(ii) when shooting or hauling their nets or when their nets have come fast upon an obstruction, the lights prescribed in 2(a) above.',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '(c) A vessel of less than 20 m in length engaged in trawling, whether using demersal or pelagic gear or engaged in pair trawling, may exhibit the lights prescribed in paragraphs (a) or (b) of this section, as appropriate.',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Section 3: Signals for Purse Seiners
                    Text(
                      '3. Signals for purse seiners',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Vessels engaged in fishing with purse seine gear may exhibit two yellow lights in a vertical line. These lights shall flash alternately every second and with equal light and occultation duration. These lights may be exhibited only when the vessel is hampered by its fishing gear.',
                      style: const TextStyle(
                        color: Colors.white60,
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
