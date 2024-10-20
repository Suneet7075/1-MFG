import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule1 extends StatefulWidget {
  const Rule1({super.key});

  @override
  _Rule1State createState() => _Rule1State();
}

class _Rule1State extends State<Rule1> {
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
          'Rule 1',
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
                      'a. These Rules shall apply to all vessels upon the high seas and in all waters connected therewith navigable by seagoing vessels.\n\n'
                          'b. Nothing in these Rules shall interfere with the operation of special rules made by an appropriate authority for roadsteads, harbours, rivers, lakes or inland waterways connected with the high seas and navigable by seagoing vessels. Such special rules shall conform as closely as possible to these Rules.\n\n'
                          'c. Nothing in these Rules shall interfere with the operation of any special rules made by the Government of any State with respect to additional station or signal lights, shapes or whistle signals for ships of war and vessels proceeding under convoy, or with respect to additional station or signal lights or shapes for fishing vessels engaged in fishing as a fleet. These additional station or signal lights, shapes or whistle signals shall, so far as possible, be such that they cannot be mistaken for any light, shape or signal authorised elsewhere under these Rules.\n\n'
                          'd. Traffic separation schemes may be adopted by the Organization for the purpose of these Rules.\n\n'
                          'e. Whenever the Government concerned shall have determined that a vessel of any special construction or purpose cannot comply with the provisions of any of these Rules with respect to the number, position, range or arc of visibility of lights or shapes, as well as to the disposition and characteristics of sound-signalling appliances, such vessel shall comply with such other provisions in regard to the number, position, range or arc of visibility of lights or shapes, as well as to the disposition and characteristics of sound-signalling appliances, as her Government shall have determined to be the closest possible compliance with these Rules in respect of that vessel.',
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
