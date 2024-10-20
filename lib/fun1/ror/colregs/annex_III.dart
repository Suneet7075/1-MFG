
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnnexIII extends StatefulWidget {
  const AnnexIII({super.key});

  @override
  _AnnexIIIState createState() => _AnnexIIIState();
}

class _AnnexIIIState extends State<AnnexIII> {
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
          'ANNEX III',
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
                      'TECHNICAL DETAILS OF SOUND SIGNAL APPLIANCES',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Section 1: Whistles
                    Text(
                      '1. Whistles',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 20),
                    // Subsection 1(a): Frequencies and range of audibility
                    Text(
                      '(a) Frequencies and range of audibility.',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white60,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'The fundamental frequency of the signal shall lie within the range 70-700Hz. The range of audibility of the signal from a whistle shall be determined by those frequencies, which may include the fundamental and/or one or more higher frequencies, which lie within the range 180-700Hz (+/-1%) for a vessel of 20 metres or more in length, or 180-2100Hz (+/-1%) for a vessel of less than 20 metres in length and which provide the sound pressure levels specified in paragraph 1(c) below.',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Subsection 1(b): Limits of fundamental frequencies
                    Text(
                      '(b) Limits of fundamental frequencies.',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'To ensure a wide variety of whistle characteristics, the fundamental frequency of a whistle shall be between the following limits:',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '(i) 70 - 200 Hz, for a vessel 200 metres or more in length;',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      '(ii) 130 - 350 Hz, for a vessel 75 metres but less than 200 metres in length;',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      '(iii) 250 - 700 Hz, for a vessel less than 75 metres in length.',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Subsection 1(c): Sound signal intensity and range of audibility
                    Text(
                      '(c) Sound signal intensity and range of audibility.',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'A whistle fitted in a vessel shall provide, in the direction of maximum intensity of the whistle and at a distance of 1 metre from it, a sound pressure level in at least one 1/3rd-octave band within the range of frequencies 180-700Hz (+/-1%) for a vessel of 20 metres or more in length, or 180-2100Hz (+/-1%) for a vessel of less than 20 metres in length, of not less than the appropriate figure given in the table below.',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    // Table for sound signal intensity
                    Center(
                      child: Table(
                        border: TableBorder.all(color: Colors.white),
                        columnWidths: const {
                          0: FlexColumnWidth(3),
                          1: FlexColumnWidth(2),
                          2: FlexColumnWidth(2),
                        },
                        children: const [
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Length of vessel in metres',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '1/3rd-octave band level at 1 metre in dB referred to 2 x 10⁻⁵ N/m²',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Audibility range in nautical miles',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '200 or more',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '143',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '2',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '75 but less than 200',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '138',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '1.5',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '20 but less than 75',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '130',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '1',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Less than 20',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '120*\n------------------115**\n------------------111***',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '0.5',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    // Explanation for the footnotes
                    Text(
                      '* When the measured frequencies lie within the range 180-450Hz\n** When the measured frequencies lie within the range 450-800Hz\n*** When the measured frequencies lie within the range 800-2100Hz',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Subsection 1(d): Directional properties
                    Text(
                      '(d) Directional properties.',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'The sound pressure level of a directional whistle shall be not more than 4 dB below the prescribed sound pressure level on the axis at any direction in the horizontal planewithin ±45 degrees of the axis. The sound pressure level at any other direction in the horizontal plane shall be not more than 10 dB below the prescribed sound pressure level on the axis, so that the range in any direction will be at least half the range on the forward axis. The sound pressure level shall be measured in that 1/3rd-octave band which determines the audibility range',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    // Subsection 1(d): Directional properties
                    Text(
                      '(e) Positioning of whistles.',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'When a directional whistle is to be used as the only whistle on a vessel, it shall be installed with its maximum intensity directed straight ahead. A whistle shall be placed as high as practicable on a vessel, in order to reduce interception of the emitted sound by obstructions and also to minimize hearing damage risk to personnel. The sound pressure level of the vessels own signal at listening posts shall not exceed 110 dB (A) and so far as practicable should not exceed 100 dB (A).\n',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    Text(
                      '(f) Fitting of more than one whistle.',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'If whistles are fitted at a distance apart of more than 100 m, it shall be so arranged that they are not sounded simultaneously.',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Section (g) Combined whistle systems
                    Text(
                      '(g) Combined whistle systems.',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'If due to the presence of obstructions the sound field of a single whistle or of one of the whistles referred to in paragraph 1(f) above is likely to have a zone of greatly reduced signal level, it is recommended that a combined whistle system be fitted so as to overcome this reduction. For the purposes of the Rules, a combined whistle system is to be regarded as a single whistle. The whistles of a combined system shall be located at a distance apart of not more than 100 metres and arranged to be sounded simultaneously. The frequency of any one whistle shall differ from those of the others by at least 10 Hz.',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),


                    Text(
                      '2. Bell or Gong',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '(a) Intensity of signal.',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'A bell or gong, or other device having similar sound characteristics shall produce a sound pressure level of not less than 110 dB at a distance of 1 metre from it.',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),

                    Text(
                      '(b) Construction.',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Bells and gongs shall be made of corrosion-resistant material and designed to give a clear tone. The diameter of the mouth of the bell shall be not less than 300 mm for vessels of 20 metres or more in length. Where practicable, a power-driven bell striker is recommended to ensure constant force but manual operation shall be possible. The mass of the striker shall be not less than 3 per cent of the mass of the bell.',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Section 3: Approvals
                    Text(
                      '3. Approvals',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'The construction of sound signal appliances, their performance and their installation on board the vessel shall be to the satisfaction of the appropriate authority of the State whose flag the vessel is entitled to fly.\n\n',
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
