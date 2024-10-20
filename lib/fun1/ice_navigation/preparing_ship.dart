import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../full_screen_image.dart';


class PreparingShip extends StatefulWidget {
  const PreparingShip({super.key});

  @override
  _PreparingShip createState() => _PreparingShip();
}

class _PreparingShip extends State<PreparingShip> {
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
          'Preparing Ship for Ice',
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
                      'Preparing Ship for Ice',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(

                      'There are many considerations that must be taken into account when preparing a Ship for ice, ranging from the deck and engine preparation to hull integrity, navigation, accommodation and experience of the crew. The ice environment is so far removed from the environment of normal blue water shipping that adaptation by the crew to the conditions, as well as changes to the ships, are essential.\n\n'
                          'A Ship in transit must ensure that all its needs for fuel, provisions and Spares are met before entry into an area such as the Canadian Arctic. Only limited and costly opportunities exist for restoring or obtaining spares parts and fuel is almost impossible to obtain. Arrangements may be possible for advance fuel orders, but the bridge team must prepare the ship to be totally self-contained unless specific deliveries are planned well in advance.\n\n'
                          'Emergency response is greatly affected by areas remoteness. There are no salvage tugs waiting for calls for assistance and few helicopters within range to take injured crew or passengers to modern medical facilities.\n\n'
                          'Any Ship hoping to successfully navigate through ice concentrations should be suitably constructed and equipped. Operational features such as engines, steering gear and navigation equipment are essential elements for carrying out the voyage.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '1. Engines',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(

                      'These must be reliable and responsive to bridge orders. Manoeuvring speed, inclusive of astern movements, must be anticipated if the ship is proceeding through pack ice. Filters to sea suctions must undergo regular inspections by watch-keepers and any dangers of overheating must be countered by effective watch-keeping duties. Access to suction strainers to allow easy removal and cleaning will be useful for ships operating within the ice environment Purifiers and fuel injection elements must be well maintained to ensure continuous and reliable operation of main engines.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '2. Steering Gear',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(

                      'This must be capable of quick and effective response. Emergency and auxiliary steering systems should be tested before entering ice infested regions.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '3. Navigation Equipment',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(

                      'All instruments should be operationally tested before entering ice limits. Any defects should be corrected if possible, and inexperienced officers should have onboard training on new or unfamiliar equipment. The Masters standing orders for ice sightings, movement in ice and expected navigation duties should be in line with the available bridge equipment. Bridge wing search light should be kept clean and operational for anticipated use.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '4. Communications',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(

                      'These systems, both internal and external, should be without defect, and back-up systems should be tested periodically to ensure reliability. VTS and local communication procedures should be incorporated into the passage p should be made of NAVTEX and ice reports relevant to the ships progres.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '5. Ice Strengthening',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(

                      'Where a ship has limited ice strengthening, additional provision should be considered communication procedures should be incorporated into the passage plan. Full use should be made of NAVTEX and ice reports relevant to the ships progress.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '6. Ballast and Trim',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(

                      'The ship should be ballasted as deeply as possible keeping in mind the requirement to allow for freezing of the ballast tanks if they are unheated. The normal practice is to fill to only 90% to allow for expansion of the ballast water during freezing. The ballast tanks will remain unfrozen in relatively cold conditions because of the free water effect and constant movement of the water. However ice can form on the steelwork in the ballast tanks and sounding pipes, air pipes and valves to these tanks. If prolonged navigation in ice is expected then some form of heating should have provided to ballast tanks above waterline. If the ballast tanks do not have heating, circulating the ballast will keep the water moving and prevent it from freezing. Any ice that forms in ballast tanks will equate to a dead-freight value.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '6. Ballast and Trim',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(

                      'The ship should be ballasted as deeply as possible keeping in mind the requirement to allow for freezing of the ballast tanks if they are unheated. The normal practice is to fill to only 90% to allow for expansion of the ballast water during freezing. The ballast tanks will remain unfrozen in relatively cold conditions because of the free water effect and constant movement of the water. However ice can form on the steelwork in the ballast tanks and sounding pipes, air pipes and valves to these tanks. If prolonged navigation in ice is expected then some form of heating should have provided to ballast tanks above waterline. If the ballast tanks do not have heating, circulating the ballast will keep the water moving and prevent it from freezing. Any ice that forms in ballast tanks will equate to a dead-freight value.\n'
                      'There is a real possibility of ballast water freezing, particularly in the tanks that are positioned close on the Ships Side. Freezing tanks can cause expansion and subsequent cracking or distortion to the tank structure. Because of the wind chill effect, ballast tanks above the waterline will be at greater risk than those tap blow.\n'
                      'Ice will form in seawater (with density of 1.025) at minus 1.8°C (28.8°F)\n'
                      'The Trim should provide the best handling ability while keeping the propeller as deep as to avoid ice damage to the tips of the blades. Should a ship steer best on an even keel it is essential that the propeller is at least some distance below the waterline, allowing for the thinness of ice that may be encountered. If the ship is in ballast and has the capability of ballasting the holds, this should be considered if the ships stability can safely allow it.\n'
                      'Damage to rudders, propellers or pod propulsion units is usually caused by heavy surface ice formations. If the propellers can be submerged below levels of surface ice, it tends to have less ice contact and so suffers less damage. Exposure of rudder couplings, Azipods and propeller blades at surface level increases the possibility of contact with surface ice, resulting in damage propeller blades and jammed steering units. Ducted propellers or ducted Azipods are more likely to accumulate ice formations than conventional, open designed propellers.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '7. Fresh Water Tanks and Fire Lines',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(

                      'Fresh Water Tanks, Such as those in the lifeboats, should be no more than 75% full and all exposed waterlines, both salt and fresh water, should be drained down.\n'
                          'The fire line must be drained completely before arrival in cold weather areas and all exposed valves left cracked open. If this is not carried out moisture within the valve can freeze and make it impossible to open. After use in cold conditions, it is important to drain the fire line quickly. To achieve rapid draining(less than 10 mins) the following vales should be opened fully.\n'
                          '       - Lowest valve on the Main Deck\n'
                          '       - Upper Exposed Bridge Deck valves\n'
                          '       - Upper Exposed Forecastle Valves\n'
                          'The air flow from upper valves will accelerate the speed of drainage. Oce the line drained, all exposed valves must be left crack open, except for the:\n'
                      '      * Valves for washing anchors. This avoids ice accumulation in the hawse pipe and an accidental drop in pressure if a fire occurs.\n'
                      '      * Isolating valves in the forecastle.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '8. Main Engine',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(

                      'The main engine on ships operating in very low temperatures (Minus 30°C or less) will be exposed to operational conditions and events not occurring on conventional trade routes.\n'
                          'Ships fitted with diesel engines, either as prime mover ot for electrical generation, may discover occasions when the diesel engine will not fire because of the low temperature of the combustion air/fuel mixture, preventing auto ignition when compressed in the engine cylinders.\n'
                          'Ships fitted with diesel engines that switch to marine diesel oil (MDO) for manoeuvring would have to carry sufficient MDO bunkers for prolonged operations in ice conditions. There have been numerous accounts of ships running out of MDO when operating for longer than anticipated in ice.\n'
                          '4 stroke arrangements has advantage over 2 stroke arrangements in heavy ice as the 4 stroke engine can provide 100% torque at low rev/min.\n'
                          'Shaft Seal are frequently damaged during operating in ice conditions. Make sure vessel have sufficient spares.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '9. Sea Inlets',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(

                      'Ships in Arctic water can encounter problems at water intakes and a in pumps when the agitation of suspended ice crystals leads to rapid consolidation. If ice or slush enters the sea inlet chest, the flow of seawater to the engine cooling system can be obstructed. This problem is encountered by the majority of ships entering ice covered waters and may result in overheating of the prime mover and loss of propulsion power, creating a dead in water scenario. Deep draughted vessels are less affected by these conditions.\n'
                          'Some precautions and guidelines:\n'
                          '     - Keep High sea suction closed\n'
                          '     - Low sea suction may need to be slowed\n'
                          '     - Discharge overboard should be almost closed to obtain positive recirculation.\n'
                      'To avoid ice accumulation in the strainers, it is important to reduce the quantity of seawater being pumped into the cooling system, this can be achieved by number of ways\n'
                      '     1. Reduce the rate of the flow through the seawater pump discharge valve\n'
                          '     2. Use a lower capacity pump instead of main seawater pump\n'
                          '     3. Reduce the flow of cooling water to all other cooling systems in the engine room\n'
                      '-  Use only one seachest at a time.'
                      '- Monitoring seawater pressure at the inlet is the best check for the presence of ice in the circuit.'
                      '- Fluctuations and eventually, a significant drop of pressure will indicate that its time to clean the strainer\n'
                      '- Cleaning the strainer is a risky operation and must be carried out with gr caution.\n'
                      '- Do not use a seawater strainer without its perforated plate properly installed inside. This plate acts like a filter, preventing large chunks of ice entering into the circulating system.\n'
                      '- On some ships ballast water can circulated in cooling water line.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '10. Search lights',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(

                      'To enable the ship to continue under way at night, good search lights are essential. They must be mounted to provide a bright beam of light at least 90m (approx 100yards) ahead of the ship.\n'
                      'It is preferable to have two lights with a remote control that allows the beam to be directed out on each side of the ship. If this is not available, it is prudent to stop the ship at night when encountering heavy ice.\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '11. Covers',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(

                      'Covers that are positioned over exposed deck equipments achieve two goals. They prevent water from getting on and into the equipment and freezing, and also allow the ice to be removed easily, PVC or plastic is better fabric to use than canvas. Avoid material made from natural fibers for painters, embarkation ladders ropes or protective tarps because natural fibers absorb moisture and loose flexibility and durability under cold weather conditions.\n'
                      'Covers should be considered for the following equipment:\n'
                      '- Open life boats\n'
                      '- Winches and windlasses\n'
                      '- Pilot ladders\n'
                      '- Sounding pipes\n'
                      '- Filling Pipes Ventilators\n'
                      '- Hatch accesses\n'
                      '- Machinery control areas\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      '12. Ice Accretion and Stability',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(

                      'Ice Accretion is the process where a layer of ice builds up on solid objects exposed to freezing precipitation, sea spray, super cooled fog or cloud droplets.\n'
                      'When ship is preparing for ice conditions, its stability must always be considered. Any reduction of water from a full ballast tank will present a free surface effect. This will make a considerable difference to the overall stability of the ship.\n'
                      'Asymmetric icing where only one side or part of the ship acquires a degree of icing, can occur. This can lead to the ship generating a list angle and may leave it vulnerable to external forces, such as wind and wave action.\n'
                          'The amount of ice accretion is influenced by many factors:\n'
                          '    - Wind force\n'
                          '    - Air temperature\n'
                          '    - Ships Course and Speed\n'
                          '    - Wave Height\n'
                          '    - Temperature of the seas surface\n\n',

                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Text(
                      'A buildup of ice on the ships forecastle will cause a change of trim by ahead and the propeller to rise.',
                      style: GoogleFonts.playfairDisplay(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(

                      'If a ship encounters the appropriate environmental conditions, there can be a build-up of ice on the deck, with the bulk of the ice being forward and on the windward side. The tonnage of this ice can vary, but on a large ship it is easily possible to accumulate 300 tons of ice in a 24 hour period. As the layer of ice grows, a displacement in weight takes place. This displacement reduces the stability of the ship. Some ships are more prone to the effects of ice accretion than others:\n'
                      '    - Container ships\n'
                      '    - LNG carriers of the GazTransport/Technigaz design\n'
                      '    - high-sided car carriers\n'
                      '    - ships with deck cargo.\n'
                   'The accretion rate can, dependent on the weather, be lessened by either altering course or reducing speed or through a combination of both. In severe storms however even with the ship hove to, the rate of ice accretion will quickly increase.\n\n',

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
                          MaterialPageRoute(builder: (context) => FullScreenImagePage(imagePath: 'images/fun1/ice4.png',)),
                        );
                      },
                      child: Column(
                        children: [
                          Center(
                            child: Image.asset(
                              'images/fun1/ice4.png',
                              fit: BoxFit.cover,
                              height:350,
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


