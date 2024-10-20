import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../full_screen_image.dart';

class GpsMisc extends StatefulWidget {
  const GpsMisc({super.key});

  @override
  _GpsMisc createState() => _GpsMisc();
}

class _GpsMisc extends State<GpsMisc> {
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
          'Gps Misc.',
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
                      'SOLAS Requirements',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      'SOLAS CH V/ Regulation 19, 2.1.6\n\n'
                          'All ships irrespective of size shall have, a receiver for a global navigation satellite system or a terrestrial radio navigation system, or other means, suitable for use at all times throughout the intended voyage to establish and update the ships position by automatic means.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Two GPS on ship show slight different positions',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      'Its not because their antennas are separated by some distance.'
                          'Each GPS receiver has its own clock which are less stable which means each receiver has its own clock error and when it solves the equations to determine the precise position of the receiver i.e. d= s x At where s is speed of light (3 X 10 meters per second) and at is the time difference(At) between data transmitted from different satellites and its reception at the receiver. At varies for each GPS resulting in the different values of d & hence slight difference in the position.\n\n',

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


