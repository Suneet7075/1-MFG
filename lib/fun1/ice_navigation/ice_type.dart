import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class IceType extends StatefulWidget {
  const IceType({super.key});

  @override
  _IceType createState() => _IceType();
}

class _IceType extends State<IceType> {
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
          'Type of Ice',
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
                      'Types of Ice',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(

                      'Because of the effect that salinity has on the ice formation process, ice is coded in two ways:\n'
                      'Lake (fresh water) ice: This ice forms in water with a salt content of than 24.7 parts per thousand.The Lake Ice Code is used for identification.\n'
                      'Sea ice: This ice forms in water with salinity more than 24.7 parts per thousand. The sea ice codes are used for identification\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '1. Fresh Water Ice:',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(

                      'This is the Ice that is almost entirely made up of the fresh water. It can be found, for example, in the Baltic Sea and the Upper reaches of the St. Lawrence Seaway and the Great Lakes. It is white and has a clearly visible crystalline structure. Fresh water ice is very hard but brittle, and is similar to concrete in strength.\n'
                      'Brash and frazil ice cause the most problems to shipping on lakes and rivers. Both types can fill channels vertically and create high friction between the ships hull and the ice. A low friction and hard-wearing coating on the hull can ease the problem.\n'
                      'Snow ice is a type that is also found on lakes or rivers. It is granular, opaque and white, with no large ice crystals. Snow ice is formed when a snow cover is saturated by rain or by submersion in a lake.\n\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '2. Sea Ice:',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(

                      'Sea ice is very different to fresh water ice. It forms more slowly because salt water sinks away from the cold surface before it cools enough to freeze. The averages salinity of the ocean can vary in density from 1020-1030, but in polar regions it may be of a density less than 1016. The freezing point of seawater varies according to its salinity. When ocean salinity is 35 psu (35,000p pm), the sea water freezes at minus 1.8°C(28.8°F). Fresh water freezes at 0°C (32°F). Because oceans are so deep, it takes longer to reach freezing point, so the top 100 to 150 metres (300 to 450 feet) of water must be cooled to the freezing temperature for ice to form.\n'
                          'When sea ice is first formed, it contains pockets of brine between the ice crystals. Normal temperature fluctuations in the ice cause the pockets of brine to change in salt concentration. As the ice becomes colder, water freezes to the sides of the pockets, making the brine more concentrated, while warmer temperatures cause the inner walls of the pockets to melt, diluting the brine. Because of this, the strength of sea ice is more dramatically affected by temperature than fresh water ice.\n'
                      'It is well known that water expands as it freezes. However, once it is ice, it shrinks as it becomes colder. Changes in air temperature can cause ice to bend and thermal cracks to form. As the season progresses, any salts gradually drain from the ice until, after approximately one year, the ice is formed of almost completely fresh water. There are a number of identifiable ice types, both sea and that can be encountered.\n\n',

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


