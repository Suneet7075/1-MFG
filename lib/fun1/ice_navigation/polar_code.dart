import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


class PolarCode extends StatefulWidget {
  const PolarCode({super.key});

  @override
  _PolarCode createState() => _PolarCode();
}

class _PolarCode extends State<PolarCode> {
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


  final String url = 'https://wwwcdn.imo.org/localresources/en/MediaCentre/HotTopics/Documents/POLAR%20CODE%20TEXT%20AS%20ADOPTED.pdf';
  Future<void> _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Polar Code',
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

                    Center(
                      child: SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: _launchURL, // Open the URL when the button is clicked
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Colors.black, // Button background color (black)
                            shadowColor: Colors.white, // White shadow
                            elevation: 8, // Elevation to create shadow effect
                          ),
                          child: Text(
                            "Polar Code",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),



                    const SizedBox(height: 10),
                    Text(
                        '\nIMOs International Code for Ships Operating in Polar Waters (Polar Code) is mandatory under both the International Convention for the Safety of Life at Sea (SOLAS) and the International Convention for the Prevention of Pollution from Ships (MARPOL). The Polar Code covers the full range of design, construction, equipment, operational, training, search and rescue and environmental protection matters relevant to ships operating in the inhospitable waters surrounding the two poles. The Polar Code entered into force on 1 January 2017.\n\n'

              'The Polar Code and SOLAS amendments were adopted during the 94th session of IMOs Maritime Safety Committee (MSC), in November 2014: the environmental provisions and MARPOL amendments were adopted during the 68th session of the Marine Environment Protection Committee (MEPC) in May 2015.\n\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Summary',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'The Polar Code is intended to cover the full range of shipping-related matters relevant to navigation in waters Surrounding the two poles — ship design, construction and equipment; operational and training concerns; search and rescue; and, equally important, the protection of the unique environment and eco-systems of the polar regions.\n'

                        'The Polar Code includes mandatorymeasures covering safety part (part I-A)and pollution prevention (part II-A) and recommendatory provisions for both (parts I-B and II-B).\n\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Polar Code Content',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '* Preamble, Introduction\n'
                        '* Part I-A: Safety Measures\n'
                          'Chapter 1 - General\n'
                    'Chapter 2 - Polar Waters Operational Manual (PWOM)\n'
                        'Chapter 3 - Ship Structure\n'
              'Chapter 4 - Subdivision and Stability\n'

                  'Chapter 5 - Watertight and Weathertight Integrity\n'
                  'Chapter 6 - Machinery Installations\n'

              'Chapter 7 - Fire Safety/Protection\n'

              'Chapter 8 - Life-saving Appliances\n'

              'Chapter 9 —- Safety of Navigation\n'

              'Chapter 10 - Communication\n'

              'Chapter 11 - Voyage Planning'

                 'Chapter 12 - Manning and Training\n\n'

                  'Part I-B: Additional Guidance\n\n'

              'Part II-A: Pollution Prevention Measures\n'

              'Chapter 1 - Prevention of Pollution by Oil (MARPOL Annex I)\n'
                  'Chapter 2 - Prevention of Pollution by Noxious Liquid Substances(MARPOL Annex II)\n'

                'Chapter 4 — Prevention of Pollution by Sewage from Ships (MARPOL Annex IV)\n'

              'Chapter 5 - Prevention of Pollution by Garbage from Ships (MARPOL Annex V)\n\n'
    '* Part II-B: Additional Guidance\n\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),


                    const SizedBox(height: 10),
                    Text(
                      'The IMO has developed a raft of requirements, guidelines and recommendations regarding polar ice-covered waters, concerning Arctic and/or Antarctic areas. These relate to maritime safety and prevention of marine pollution, as well as certification of seafarers on ships operating in polar areas.\n'

                    'The Guidelines aim at mitigating the additional risk imposed on shipping due to the harsh environmental and climatic conditions existing in polar waters.\n\n'

                    'They address the fact that the polar environment imposes additional demands on ship systems, including navigation, communications, life-saving appliances, main and auxiliary machinery, environmental protection and damage control, and emphasize the need to ensure that all ship systems both are capable of functioning effectively under anticipated operating conditions and provide adequate levels of safety in accident and emergency situations.\n'

                      'In addition, the Guidelines recognize that safe operation in such conditions requires specific attention to human factors, including training and operational procedures.\n\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Application',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Only vessels that intend to operate within the Arctic and Antarctic areas as defined in the Polar Code need to comply with the code.\n\n'

                    'Ships constructed on or after 1 January 2017 shall comply with the safety part of Polar Code at delivery.\n\n'

                    'Ships constructed before 1 January 2017 shall comply with the safety part of the Polar Code by the first intermediate or renewal survey, whichever occurs first, after 1 January 2018.\n\n'

                    'The environmental part of the Polar Code applies to all ships certified under MARPOL Annexes I, II, IV and V respectively. Existing and new ships certified under MARPOL shall comply with the environmental requirements by 1 January 2017. This means that fishing vessels (that carry MARPOL certificates) will also have to comply with the environmental part of the code, although not carrying any SOLAS certificates.\n\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Polar Ship certificate:',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'The safety part of the code has design, construction, equipment, operational, training, search and rescue requirements related to the potential hazards of operating in polar regions, including ice, remoteness and severe and rapidly changing weather conditions. It is written in a goal based manner and provides both functional requirements and detailed requirements.\n\n',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Types of Ships as per Polar Code:',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Category A ship means a ship designed for operation in polar waters in at least medium first-year ice, which may include old ice inclusions.\n\n'

                    'Category B ship means a ship not included in category A, designed for operation in polar waters in at least thin first-year ice, which may include old ice inclusions.\n\n'

                    'Category C ship means a ship designed to operate in open water or in ice conditions less severe than those included in categories A and B.\n\n',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Navigational Equipment Requirement',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '- ships shall have two non-magnetic means to determine and display their heading. Both means shall be independent and shall be connected to the ships main and emergency source of power; and\n\n'

                    '- ships proceeding to latitudes over 80 degrees shall be fitted with at least one GNSS compass or equivalent, which shall be connected to the ships main and emergency source of power.\n\n'

                      '- Ships, with the exception of those solely operating in areas with 24 hours daylight, shall be equipped with two remotely rotatable, narrow-beam search lights controllable from the bridge to provide lighting over an arc of 360 degrees, or other means to visually detect ice.\n\n'

                    '- ships involved in operations with an icebreaker escort shall be equipped with a manually initiated flashing red light visible from astern to indicate when the ship is stopped. This light shall have a range of visibility of at least two nautical miles, and the horizontal and vertical arcs of visibility shall conform to the stern light specifications required by the International Regulations for Preventing Collisions at Sea.\n\n'

                   '- ships shall have means of receiving and displaying current information on ice conditions in the area of operation.\n'

                    '- ships constructed on or after 1 January 2017, ice strengthened in accordance with chapter 3 of Polar Code, shall have either two independent echo- sounding devices or one echo-sounding device with two separate independent transducers;\n\n'

                    '- for ships operating in areas, and during periods, where ice accretion is likely to occur, means to prevent the accumulation of ice on antennas required for navigation and communication shall be provided.\n\n',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Training Requirements',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Chapter 12 of the Polar Code on manning and training says that companies must ensure that masters, chief mates and officers in charge of a navigational watch on board ships operating in polar waters have completed appropriate training, taking into account the provisions of the International Convention on Standards of Training, Certification and Watchkeeping for Seafarers (STCW) and its related STCW Code.\n'

                '- Mandatory minimum requirements for the training and qualifications of masters and deck officers on ships operating in polar waters were also adopted by IMOs Maritime Safety Committee in November 2016. They became mandatory under the STCW Convention and the STCW Code from 1 July 2018.\n\n',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Protection of the Antarctic from heavy grade oils',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'A MARPOL regulation, to protect the Antarctic from pollution by heavy grade oils, was adopted by the Marine Environment Protection Committee (MEPC), at its 60th session in March, 2010. The amendments entered into force on 1 August 2011.\n'

                          'The amendments add a new chapter 9 to MARPOL Annex | with a new regulation 43 which prohibits the carriage in bulk as cargo, or carriage and use as fuel, of: crude oils having a density at 15°C higher than 900 kg/m3; oils, other than crude oils, having a density at 15°C higher than 900 kg/m3 or a kinematic viscosity at 50°C higher than 180 mm2/s; or bitumen, tar and their emulsions. An exception is envisaged for vessels engaged in securing the safety of ships or in a Search and rescue operation.\n\n'
                      'Under the Polar Code ships are encouraged not to use or carry heavy fuel oil in the Arctic. IMOs Sub- Committee on Pollution Prevention and Response (PPR) 7th session in 2020 agreed draft amendments to MARPOL Annex | (addition of a new regulation 43A) to introduce a prohibition on the use and carriage for use as fuel of heavy fuel oil (HFO) by ships in Arctic waters on and after 1 July 2024. The draft amendments will be submitted to the Marine Environment Protection Committee with a view to approval and circulation for future adoption.\n\n',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Voyage planning in remote areas',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'The IMO Assembly in November 2007 adopted resolution A.999(25) Guidelines on voyage planning for passenger ships operating in remote areas, in response to the growing popularity of ocean travel for passengers and the desire for exotic destinations, which have led to increasing numbers of passenger ships operating in remote areas. When developing a plan for voyages to remote areas, special consideration should be given to the environmental nature of the area of operation, the limited resources, and navigational information.\n\n'

                          'The detailed voyage and passage plan should include the following factors: Safe areas and no-go areas; surveyed marine corridors, if available; and contingency plans for emergencies in the event of limited support being available tor assistance in areas remote from SAR facilities.\n\n'
                          'In addition, the detailed voyage and passage plan for ships operating in Arctic or Antarctic waters should include the following factors: conditions when it is not safe to enter areas containing ice or icebergs because of darkness, swell, fog and pressure ice; safe distance to icebergs; and presence of ice and icebergs, and safe speed in such areas.\n',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Ship reporting in the Arctic region',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'The MSC, at its 91st session in November 2012, adopted a new mandatory ship reporting system ‘In the Barents Area (Barents SRS)" (proposed by Norway and the Russian Federation). The new mandatory ship reporting system entered into force at 0000 hours UTC on 1 June 2013. The following categories of ships passing through or proceeding to and from ports and anchorages in the Barents SRS area are required to participate in the ship reporting system, by reporting to either Vardg VTS centre or Murmansk VTS centre: all ships with a gross tonnage of 5,000 and above; all tankers; all ships carrying hazardous cargoes; a vessel towing when the length of the tow exceeds 200 metres; and any ship not under commanqa, restricted in their ability to manoeuvre or having defective navigational aids.\n\n',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'Ship routeing in the Arctic',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'The MSC, at its 99th session in May 2018, adopted new and amended ships’ routeing measures in the Bering Sea and Bering Strait, aimed at reducing the risks of incidents - the first measures adopted by IMO for the Arctic region where the Polar Code applies.\n'
                      'The measures include six two-way routes and six precautionary areas, to be voluntary for or all ships of 400 gross tonnage and above, in the Bering Sea and Bering Strait off the coast of the Chukotskiy Peninsula and Alaska\n',
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


