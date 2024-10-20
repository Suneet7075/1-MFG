import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule31 extends StatefulWidget {
  const Rule31({super.key});

  @override
  _Rule31State createState() => _Rule31State();
}

class _Rule31State extends State<Rule31> {
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
          'Rule 31',
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
                      'Seaplanes',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Where it is impracticable for a seaplane or a WIG craft to exhibit lights and shapes of the characteristics or in the positions prescribed in the Rules of this Part, it shall exhibit lights and shapes as closely similar in characteristics and position as is possible.',
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
