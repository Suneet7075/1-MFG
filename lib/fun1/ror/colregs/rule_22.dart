import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule22 extends StatefulWidget {
  const Rule22({super.key});

  @override
  _Rule22State createState() => _Rule22State();
}

class _Rule22State extends State<Rule22> {
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
          'Rule 22',
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
                      'Visibility of Lights',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildVisibilitySection(
                      'a) In vessels of 50 metres or more in length:',
                      [
                        'a masthead light, 6 miles;',
                        'a sidelight, 3 miles;',
                        'a sternlight, 3 miles;',
                        'a towing light, 3 miles;',
                        'a white, red, green or yellow all-round light, 3 miles.',
                      ],
                    ),
                    _buildVisibilitySection(
                      'b) In vessels of 12 metres or more in length but less than 50 m in length:',
                      [
                        'a masthead light, 5 miles; except that where the length of the vessel is less than 20 meters, 3 miles;',
                        'a sidelight, 2 miles;',
                        'a sternlight, 2 miles;',
                        'a towing light, 2 miles;',
                        'a white, red, green or yellow all-round light, 2 miles.',
                      ],
                    ),
                    _buildVisibilitySection(
                      'c) In vessels of less than 12 metres in length:',
                      [
                        'a masthead light, 2 miles;',
                        'a sidelight, 1 mile;',
                        'a sternlight, 2 miles;',
                        'a towing light, 2 miles;',
                        'a white, red, green or yellow all-round light, 2 miles.',
                      ],
                    ),
                    _buildVisibilitySection(
                      'd) In inconspicuous, partly submerged vessels or objects being towed:',
                      [
                        'a white all-round light, 3 miles.',
                      ],
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

  Widget _buildVisibilitySection(String heading, List<String> details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: GoogleFonts.playfairDisplay(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        for (String detail in details)
          Text(
            detail,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 18,
              height: 1.5,
            ),
          ),
        const SizedBox(height: 20), // Space between sections
      ],
    );
  }
}
