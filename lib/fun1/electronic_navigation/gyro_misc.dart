import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../full_screen_image.dart';

class GyroMisc extends StatefulWidget {
  const GyroMisc({super.key});

  @override
  _GyroMisc createState() => _GyroMisc();
}

class _GyroMisc extends State<GyroMisc> {
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
          'Gyro Misc.',
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
                      'As per SOLAS CH V, Regulation 19 (Carriage requirements for shipborne navigational systems and equipments)\n\n'
                          'All ships of 500 gross tonnage and upwards shall have, (Regin. 19.2.5.1 of SOLAS CH V) - a gyro compass, to determine and display their heading by shipborne non-magnetic means, being clearly readable by the helmsman at the main steering position.\n\n'
                          '- a gyro compass heading repeater, to supply heading information visually at the emergency steering position.\n'
                          '- a gyro compass bearing repeater, to take bearings, over an arc of the horizon of 360°\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Spare Carrying Requirement',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      'As per Merchant Shipping (Safety of Navigation) Rules, 1997\n\n'
                          'Spare parts and spare equipment for gyro compass installations (as appropriate for the equipment in use)\n\n'
                      'The following items should be carried on ships required by the regulations to have a gyro compass installation:\n'
                      '- 2 cartridges for each cartridge fuse in use\n'
                      '- 2 dial lamps for each dial lamp in use\n'
                      '- 1 glass, azimuth circle, for each type in use\n'
                      '- 1 glass, pelorus stand cover, for each type in use\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Care & Maintenance',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      '- Check repeaters with master gyro, to be sure repeater systems functioning properly, if required synchronize repeaters. Repeater of steering platform to be checked.\n'
                      '- Check compass by Azimuth observations. - The speed and latitude correctors should be properly set.\n'
                      '- Check alarm unit by turning switch on alarm unit and noting that buzzer sounds.\n'
                      '- Check all electrical connections to make sure they are tight, clean and free from oil.\n'
                      '- Clean and oil parts as indicated on oiling and cleaning charts in master compass room.\n',

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


