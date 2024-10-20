import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../full_screen_image.dart';

class IceNav extends StatefulWidget {
  const IceNav({super.key});

  @override
  _IceNav createState() => _IceNav();
}

class _IceNav extends State<IceNav> {
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
          'Navigation, Planning & Precaution',
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
                      'Ice Navigation, Planning, Precaution to be Observed\n',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      '- The main principle of Ice-Navigation is - "Freedom of Movement of vessel"\n\n'
                      '- Master and Bridge Team to be well versed with the POLAR Code and ship specific Polar Water Operational Manual.\n\n'
                      '- Follow the route recommended by the Ice Superintendent via the Marine Communications and Traffic Services Centre (MCTS), through the appropriate reporting system i.e. ECAREC (Eastern Canada Vessel Traffic Services Zone Regulations) or NORDREG (Northern Cana Vessel Traffic Services). This route is based on the latest available information, Masters encouraged to adjust their courses accordingly.\n\n'
                      '- Mark Ice limits on appropriate charts.\n\n'
                      '- Plot all floating icebergs position and their direction of drifting and speed.\n\n'
                      '- Extra look outs must be posted and the bridge watch may be increased, depending upon the visibility.\n\n'
                      '- Do not enter Ice if an alternative, although longer, open water route is available.\n\n'
                      '- Enter the ice at low speed to receive the initial impact, once into the pack, increase speed gradually to maintain headway and control of the ship.\n\n'
                      '- The vessel should be at right angles to the edge of the pack ice at entry to avoid glancing blows.\n\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FullScreenImagePage(imagePath: 'images/fun1/ice1.png',)),
                        );
                      },
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'images/fun1/ice1.png',
                              fit: BoxFit.cover,
                              height:260,
                            ),
                          ),
                          const SizedBox(height: 8), // Spacing between image and text
                          Center(
                            child: Text(
                              'Correct Approach to Ice Field: Reduced Speed and Perpendicular to Edge\n',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                    const SizedBox(height: 10),
                    Text(
                      '- Be prepared to go "Full Astern" at any time.\n\n'
                          '- The point of entering the ice must be chosen carefully, preferably in an area of concentration.\n\n'
                          '- Navigation in pack ice after dark should not be attempted without high-power which can be controlled easily from the bridge, If poor visibility encounters, hea ice and keep the propeller turning slowly as it is less susceptible to ice damage tha were completely stopped.\n\n'
                      '- Follow open water patches and lighter ice areas even if initially it involves large deviation of course.\n\n'
                          '- Avoid turning in heavy ice, seek lighter ice or open water pools.\n\n'
                   '- Backing in ice is a dangerous manoeuvre as it exposes the most vulnerable parts of the ship, the rudder and propeller, to the ice. It should only be attempted when absolutely necessary.\n\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FullScreenImagePage(imagePath: 'images/fun1/ice2.png',)),
                        );
                      },
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'images/fun1/ice2.png',
                              fit: BoxFit.cover,
                              height:260,
                            ),
                          ),
                          const SizedBox(height: 8), // Spacing between image and text
                          Center(
                            child: Text(
                              'Backing onto Ice: Rudder Amidships. Dead Slow Astern.\n',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FullScreenImagePage(imagePath: 'images/fun1/ice3.png',)),
                        );
                      },
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'images/fun1/ice3.png',
                              fit: BoxFit.cover,
                              height:180,
                            ),
                          ),
                          const SizedBox(height: 8), // Spacing between image and text
                          Center(
                            child: Text(
                              '\n',
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      '- Berthing: Flushing out ice with wash while bow is fixed with a spring line\n\n'
                          '- Once the ship is secured, all efforts must be made to keep the ship alongside and not to allow ice to force its way between the ship and the dock.\n\n'
                          '- Keep the engines on standby at river berths or strong tidal areas where ice is in motion.\n\n'
                          '- Mariners are advised not to rely solely on Radar for the detection of icebergs, as it is not certain that Radar will detect all types and sizes of ice and it will not differentiate old ice from first year ice.\n\n'
                          '- Full rudder is used in emergency only. Violent rudder movement may swing the stern into ice and damage the propeller.\n\n'
                          '- On deck, all the pipelines are drained and isolated.\n\n'
                      '- Keep the damage control gear ready cement, collision mats etc.\n\n'
                      '- Check heating systems of machinery and accommodation regularly.\n\n'
                      '- Ship stopped in ice inshore, must always point seaward.\n\n'
                      '- Ship should monitor the updated routing instructions from the Canadian Coast Guard Ice Operations Centers.',

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


