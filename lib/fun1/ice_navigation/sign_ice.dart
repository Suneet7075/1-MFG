import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SignIce extends StatefulWidget {
  const SignIce({super.key});

  @override
  _SignIce createState() => _SignIce();
}

class _SignIce extends State<SignIce> {
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
          'Sign of Ice',
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

                    const SizedBox(height: 20),
                    Text(
                      'Sign Of Ice in the Vicinity',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(

                      'When steaming through open water, it may be possible to detect the approach of ice by the following signs:\n\n'
                          '1. Ice blink: this is a fairly reliable sign and may be the first indication that an ice field is in the vicinity. It can usually be seen for some time before the ice itself is visible and appears as a luminous reflection on the underside of the clouds above the ice. Its clarity is increased after a fresh snowfall. On clear days, ice blink is less apparent but may appear as a light or yellowish haze which would indicate the presence of ice. Ice blink can sometimes be detected at night, either from the reflection of moonlight, or from the ambient starlight in clear weather.\n\n'
                          '2. The sighting of small fragments of ice often indicates that larger quantities are not far away.\n\n'
                          '3. Abrupt moderation of the sea and swell occur when approaching an ice field from leeward.\n\n'
                      '4. In northern areas, and in Labrador and Newfoundland, the onset of fog often indicates the presence of ice in the vicinity.\n\n\n',

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


