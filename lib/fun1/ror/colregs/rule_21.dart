import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rule21 extends StatefulWidget {
  const Rule21({super.key});

  @override
  _Rule21State createState() => _Rule21State();
}

class _Rule21State extends State<Rule21> {
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
          'Rule 21',
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
                      'Definitions',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildDefinition(
                      'a) "Masthead light" means a white light placed over the fore and aft centerline of the vessel showing an unbroken light over an arc of the horizon of 225 degrees and so fixed as to show the light from right ahead to 22.5 degrees abaft the beam on either side of the vessel.',
                    ),
                    _buildDefinition(
                      'b) "Sidelights" means a green light on the starboard side and a red light on the port side each showing an unbroken light over an arc of the horizon of 112.5 degrees and so fixed as to show the light from right ahead to 22.5 degrees abaft the beam on its respective side. In a vessel of less than 20 meters in length the sidelights may be combined in one lantern carried on the fore and aft centreline of the vessel.',
                    ),
                    _buildDefinition(
                      'c) "Sternlight" means a white light placed as nearly as practicable at the stern showing an unbroken light over an arc of the horizon of 135 degrees and so fixed as to show the light 67.5 degrees from right aft on each side of the vessel.',
                    ),
                    _buildDefinition(
                      'd) "Towing light" means a yellow light having the same characteristics as the "sternlight" defined in paragraph (c) of this Rule.',
                    ),
                    _buildDefinition(
                      'e) "All round light" means a light showing an unbroken light over an arc of the horizon of 360 degrees.',
                    ),
                    _buildDefinition(
                      'f) "Flashing light" means a light flashing at regular intervals at a frequency of 120 flashes or more per minute.',
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

  Widget _buildDefinition(String text) {
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
