import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnnexI extends StatefulWidget {
  const AnnexI({super.key});

  @override
  _AnnexIState createState() => _AnnexIState();
}

class _AnnexIState extends State<AnnexI> {
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
        'ANNEX I',
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
    'Positioning and Technical Details of Lights and Shapes',
    style: GoogleFonts.playfairDisplay(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 26,
    ),
    ),
    const SizedBox(height: 20),
    Text(
    '1. Definition',
    style: GoogleFonts.playfairDisplay(
    color: Colors.white70,
    fontWeight: FontWeight.bold,
    fontSize: 22,
    ),
    ),
    const SizedBox(height: 10),
    Text(
    'The term \'height above the hull\' means height above the uppermost continuous deck. This height shall be measured from the position vertically beneath the location of the light.',
    style: const TextStyle(
    color: Colors.white60,
    fontSize: 18,
    height: 1.5,
    ),
    ),
    const SizedBox(height: 20),
    Text(
    '2. Vertical Positioning and Spacing of Lights',
    style: GoogleFonts.playfairDisplay(
    color: Colors.white70,
    fontWeight: FontWeight.bold,
    fontSize: 22,
    ),
    ),
    const SizedBox(height: 10),
    // Existing points...
    Text(
    '(i) When the Rules prescribe two or three lights to be carried in a vertical line, they shall be spaced as follows:',
    style: const TextStyle(
    color: Colors.white60,
    fontSize: 18,
    height: 1.5,
    ),
    ),
    const SizedBox(height: 10),
      Text(
        '(i) On a vessel of 20 metres in length or more, such lights shall be spaced not less than 2 metres apart, and the lowest of these lights shall, except where a towing light is required, be placed at a height of not less than 4 m above the hull.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        '(ii) On a vessel of less than 20 metres in length, such lights shall be spaced not less than 1 metre apart and the lowest of these lights shall, except where a towing light is required, be placed at a height of not less than 2 metres above the gunwale.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        '(iii) When three lights are carried, they shall be equally spaced.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      const SizedBox(height: 20),
      Text(
        '(j) The lower of the two all-round lights prescribed for a vessel when engaged in fishing shall be at a height above the sidelights not less than twice the distance between the two vertical lights.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      const SizedBox(height: 20),
      Text(
        '(k) The forward anchor light prescribed in Rule 30(a)(i), when two are carried, shall not be less than 4.5 metres above the after one. On a vessel of 50 metres or more in length this forward anchor light shall be placed at a height of not less than 6 metres above the hull.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),

      const SizedBox(height: 20),
      Text(
        '3. Horizontal Positioning and Spacing of Lights',
        style: GoogleFonts.playfairDisplay(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        '(a) When two masthead lights are prescribed for a power-driven vessel, the horizontal distance between them shall not be less than one half of the length of the vessel but need not be more than 100 meters. The forward light shall be placed not more than one quarter of the length of the vessel from the stem.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        '(b) On a power-driven vessel of 20 meters or more in length, the sidelights shall not be placed in front of the forward masthead lights. They shall be placed at or near the side of the vessel.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        '(c) When the lights prescribed in Rule 27(b)(i) or Rule 28 are placed vertically between the forward masthead light(s) and the after masthead light(s), these all-round lights shall be placed at a horizontal distance of not less than 2 meters from the fore and after centreline of the vessel in the athwartship direction.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        '(d) When only one masthead light is prescribed for a power-driven vessel, this light shall be exhibited forward of amidships; except that a vessel of less than 20 meters in length need not exhibit this light forward of amidships but shall exhibit it as far forward as is practicable.\n\n',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),

      Text(
        '4. Details of Location of Direction-Indicating Lights for Fishing Vessels, Dredgers, and Vessels Engaged in Underwater Operations',
        style: GoogleFonts.playfairDisplay(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        '(a) The light indicating the direction of the outlying gear from a vessel engaged in fishing as prescribed in Rule 26(c)(ii) shall be placed at a horizontal distance of not less than 2 metres and not more than 6 metres away from the two all-round red and white lights. This light shall be placed not higher than the all-round white light prescribed in Rule 26(c)(i) and not lower than the sidelights.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        '(b) The lights and shapes on a vessel engaged in dredging or underwater operations to indicate the obstructed side and/or the side on which it is safe to pass, as prescribed in Rule 27(d)(i) and (ii), shall be placed at the maximum practical horizontal distance, but in no case less than 2 metres, from the lights or shapes prescribed in Rule 27(b)(i) and (ii). In no case shall the upper of these lights or shapes be at a greater height than the lower of the three lights or shapes prescribed in Rule 27(b)(i) and (ii).',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),

      Text(
        '5. Screens for Sidelights',
        style: GoogleFonts.playfairDisplay(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        'The sidelights of vessels of 20 metres or more in length shall be fitted with inboard screens painted matt black, and meeting the requirements of Section 9 of this Annex. On vessels of less than 20 metres in length, the sidelights, if necessary to meet the requirements of Section 9 of this Annex, shall be fitted with inboard matt black screens. With a combined lantern, using a single vertical filament and a very narrow division between the green and red sections, external screens need not be fitted.',
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 18,
          height: 1.5,
        ),
      ),

      const SizedBox(height: 10),
      Text(
        '(a) Shapes shall be black and of the following sizes:',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        '(i) A ball shall have a diameter of not less than 0.6 metre.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      Text(
        '(ii) A cone shall have a base diameter of not less than 0.6 metre and a height equal to its diameter.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      Text(
        '(iii) A cylinder shall have a diameter of at least 0.6 metre and a height of twice its diameter.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      Text(
        '(iv) A diamond shape shall consist of two cones as defined in (ii) above having a common base.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        '(b) The vertical distance between shapes shall be at least 1.5 metres.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        '(c) In a vessel of less than 20 metres in length, shapes of lesser dimensions but commensurate with the size of the vessel may be used, and the distance apart may be correspondingly reduced.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      Text(
      '7. Colour Specification of Lights',
      style: GoogleFonts.playfairDisplay(color:Colors.white70,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
      ),
      const SizedBox(height: 10),
      Text(
        'The chromaticity of all navigation lights shall conform to the following standards, as specified by the International Commission on Illumination (CIE). The coordinates of the color boundaries are as follows:',
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        '(i) White',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      Text(
        'x: 0.525, 0.525, 0.452, 0.310, 0.310, 0.443',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      Text(
        'y: 0.382, 0.440, 0.440, 0.348, 0.283, 0.382',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        '(ii) Green',
        style: const TextStyle(
          color: Colors.green,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      Text(
        'x: 0.028, 0.009, 0.300, 0.203',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      Text(
        'y: 0.385, 0.723, 0.511, 0.356',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        '(iii) Red',
        style: const TextStyle(
          color: Colors.red,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      Text(
        'x: 0.680, 0.660, 0.735, 0.721',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      Text(
        'y: 0.320, 0.320, 0.265, 0.259',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        '(iv) Yellow',
        style: const TextStyle(
          color: Colors.yellow,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      Text(
        'x: 0.612, 0.618, 0.575, 0.575',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      Text(
        'y: 0.382, 0.382, 0.425, 0.406\n',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),

      Text(
        '8. Intensity of Lights',
        style: GoogleFonts.playfairDisplay(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        'The minimum luminous intensity of lights shall be calculated using the formula:',
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 18,
          height: 1.5,
        ),
      ),

      RichText(
        text: TextSpan(
          style: const TextStyle(
            color: Colors.white60,
            fontSize: 18,
            height: 1.5,
          ),
          children: [
        TextSpan(
          text: 'I = 3.43 × 10⁶ × T × D² × ',
        ),
        TextSpan(
          text: 'K^',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        TextSpan(
          text: '⁻',
        ),
        TextSpan(
          text: 'D',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
        ),
      ),

      Text(
        'I is the luminous intensity in candelas under service conditions,',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      Text(
        'T is the threshold factor 2 × 10⁻⁷ lux,',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      Text(
        'D is the range of visibility (luminous range) of the light in nautical miles,',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      Text(
        'K is atmospheric transmissivity.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        'For prescribed lights, the value of K shall be 0.8, corresponding to a meteorological visibility of approximately 13 nautical miles.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),

      const SizedBox(height: 10),
      Text(
        '(b) selection of Figures Derived from the Formula:',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),

      const SizedBox(height: 10),
      Table(
        border: TableBorder.all(color: Colors.white),
        columnWidths: {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(2),
        },
        children: [
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Range of Visibility (luminous range) of light in nautical miles\n\n                 D',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Luminous Intensity of Light in Candelas for K = 0.8\n\n\n                  I',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(textAlign: TextAlign.center,
                    '1',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(textAlign: TextAlign.center,
                    '0.9',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(textAlign: TextAlign.center,
                    '2',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(textAlign: TextAlign.center,
                    '4.3',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(textAlign: TextAlign.center,
                    '3',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(textAlign: TextAlign.center,
                    '12',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(textAlign: TextAlign.center,
                    '4',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(textAlign: TextAlign.center,
                    '27',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(textAlign: TextAlign.center,
                    '5',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(textAlign: TextAlign.center,
                    '52',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(textAlign: TextAlign.center,
                    '6',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(textAlign: TextAlign.center,
                    '94',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      const SizedBox(height: 20),
      Text(
        'NOTE: The maximum luminous intensity of navigation lights should be limited to avoid undue glare.\n\n This shall not be achieved by a variable control of the luminous intensity.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),

      const SizedBox(height: 20),
      Text(
        '9. Horizontal Sectors',
        style: GoogleFonts.playfairDisplay(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        'a) (i) In the forward direction, sidelights as fitted on the vessel shall show the minimum required intensities. The intensities must decrease to reach practical cut-off between 1 degree and 3 degrees outside the prescribed sectors.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      Text(
        'a) (ii) For sternlights and masthead lights and at 22.5 degrees abaft the beam for sidelights, the minimum required intensities shall be maintained over the arc of the horizon up to 5 degrees within the limits of the sectors prescribed in Rule 21. From 5 degrees within the prescribed sectors, the intensity may decrease by 50 percent up to the prescribed limits; it shall decrease steadily to reach practical cut-off at not more than 5 degrees outside the prescribed sectors.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        'b) (i) All-round lights shall be so located as not to be obscured by masts, topmasts or structures within angular sectors of more than 6 degrees, except anchor lights prescribed in Rule 30, which need not be placed at an impracticable height above the hull.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      Text(
        'b) (ii) If it is impracticable to comply with paragraph (b)(i) of this section by exhibiting only one all-round light, two all-round lights shall be used suitably positioned or screened so that they appear, as far as practicable, as one light at a distance of one mile.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),

      const SizedBox(height: 20),
      Text(
        '10. Vertical Sectors',
        style: GoogleFonts.playfairDisplay(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        'a) The vertical sectors of electric lights as fitted, with the exception of lights on sailing vessels underway shall ensure that:',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      Text(
        'a) (i) at least the required minimum intensity is maintained at all angles from 5 degrees above to 5 degrees below the horizontal;',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      Text(
        'a) (ii) at least 60 per cent of the required minimum intensity is maintained from 7.5 degrees above to 7.5 degrees below the horizontal.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        'b) In the case of sailing vessels underway the vertical sectors of electric lights as fitted shall ensure that:',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      Text(
        'b) (i) at least the required minimum intensity is maintained at all angles from 5 degrees above to 5 degrees below the horizontal;',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      Text(
        'b) (ii) at least 50 per cent of the required minimum intensity is maintained from 25 degrees above to 25 degrees below the horizontal.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        'c) In the case of lights other than electric these specifications shall be met as closely as possible.',
        style: const TextStyle(
          color: Colors.white60,
          fontSize: 18,
          height: 1.5,
        ),
      ),

      const SizedBox(height: 20),
      Text(
        '11. Intensity of Non-Electric Lights',
        style: GoogleFonts.playfairDisplay(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        'Non-electric lights shall so far as practicable comply with the minimum intensities, as specified in the Table given in Section 8 of this Annex.',
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 18,
          height: 1.5,
        ),
      ),
      const SizedBox(height: 20),
      Text(
        '12. Manoeuvring Light',
        style: GoogleFonts.playfairDisplay(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        'Notwithstanding the provisions of paragraph 2 (f) of this Annex the manoeuvring light described in Rule 34(b) shall be placed in the same fore and aft vertical plane as the masthead light or lights and, where practicable, at a minimum height of 2 metres vertically above the forward masthead light, provided that it shall be carried not less than 2 meters vertically above or below the after masthead light. On a vessel where only one masthead light is carried the manoeuvring light, if fitted, shall be carried where it can best be seen, not less than 2 metres vertically apart from the masthead light.',
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 18,
          height: 1.5,
        ),
      ),

      const SizedBox(height:20),
      Center(
        child: Image.asset(
          'images/fun1/annex_I.png',
          fit: BoxFit.cover,
          height: 70, // Adjust the height as needed
        ),
      ),
      const SizedBox(height: 10),
      Text(
        'where:\n'
            'y is the height of the mainmast light above the fore mast light in metres;\n'
            'a is the height of the foremast light above the water surface in service condition in metres;\n'
            'Ψ is the trim in service condition in degrees;\n'
            'C is the horizontal separation of masthead lights in metres.',
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 18,
          height: 1.5,
        ),
      ),

      const SizedBox(height: 20),
      // New section 14
      Text(
        '14. Approval',
        style: GoogleFonts.playfairDisplay(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        'The construction of lanterns and shapes and the installation of lanterns on board the vessel shall be to the satisfaction of the appropriate authority of the State whose flag the vessel is entitled to fly.\n\n\n\n',
        style: const TextStyle(
          color: Colors.white70,
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
