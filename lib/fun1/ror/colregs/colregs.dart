import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/annex_I.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/annex_II.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/annex_III.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_1.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_10.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_11.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_12.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_13.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_14.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_15.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_16.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_17.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_20.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_23.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_24.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_26.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_28.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_29.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_31.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_33.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_35.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_37.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_39.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_41.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_8.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_18.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_19.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_2.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_21.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_22.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_25.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_27.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_3.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_30.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_32.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_34.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_36.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_38.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_4.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_40.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_5.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_6.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_7.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/rule_9.dart';

import 'annex_IV.dart'; // Import the package for auto resizing text

class Colregs extends StatefulWidget {
  const Colregs({super.key});

  @override
  State<Colregs> createState() => _ColregState();
}

class _ColregState extends State<Colregs> {
  bool isPartAExpanded = false;
  bool isPartBExpanded = false;
  bool isPartCExpanded = false;
  bool isPartDExpanded = false;
  bool isPartEExpanded = false;
  bool isPartFExpanded = false;
  bool isPartGExpanded = false;

  bool isSectionIExpanded = false;
  bool isSectionIIExpanded = false;
  bool isSectionIIIExpanded = false;

  void _navigateToPage(String rule) {
    // Implement your navigation logic here
    switch (rule) {
      case 'Rule 1: Application':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule1()),
        );
        break;

      case 'Rule 2: Responsibility':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule2()),
        );
        break;

      case 'Rule 3: General Definitions':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule3()),
        );
        break;

      case 'Rule 4: Application':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule4()),
        );
        break;

      case 'Rule 5: Look-out':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule5()),
        );
        break;

      case 'Rule 6: Safe Speed':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule6()),
        );
        break;

      case 'Rule 7: Risk of Collision':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule7()),
        );
        break;

      case 'Rule 8: Action to Avoid Collision':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule8()),
        );
        break;

      case 'Rule 9: Narrow Channels':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule9()),
        );
        break;

      case 'Rule 10: Traffic Separation Schemes':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule10()),
        );
        break;

      case  'Rule 11: Application':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule11()),
        );
        break;

      case  'Rule 12: Sailing Vessels':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule12()),
        );
        break;

      case   'Rule 13: Overtaking':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule13()),
        );
        break;

      case 'Rule 14: Head-on Situation':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule14()),
        );
        break;

      case  'Rule 15: Crossing Situation':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule15()),
        );
        break;

      case 'Rule 16: Action by Give-way Vessel':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule16()),
        );
        break;

      case  'Rule 17: Action by Stand-on Vessel':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule17()),
        );
        break;

      case  'Rule 18: Responsibilities Between Vessels':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule18()),
        );
        break;

      case  'Rule 19: Conduct of Vessels in Restricted Visibility':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule19()),
        );

      case  'Rule 20: Application':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule20()),
        );
        break;

      case  'Rule 21: Definitions':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule21()),
        );
        break;

      case  'Rule 22: Visibility of Lights':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule22()),
        );
        break;

      case   'Rule 23: Power-driven Vessels Underway':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule23()),
        );
        break;

      case   'Rule 24: Towing and Pushing':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule24()),
        );
        break;

      case   'Rule 25: Sailing Vessels Underway and Vessels Under Oars':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule25()),
        );
        break;

      case  'Rule 26: Fishing Vessels':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule26()),
        );
        break;

      case  'Rule 27: Vessels Not Under Command or Restricted in Their Ability to Manoeuvre':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule27()),
        );
        break;

      case  'Rule 28: Vessels Constrained by Their Draught':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule28()),
        );
        break;

      case  'Rule 29: Pilot Vessels':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule29()),
        );
        break;

      case  'Rule 30: Anchored Vessels and Vessels Aground':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule30()),
        );
        break;

      case   'Rule 31: Seaplanes':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule31()),
        );
        break;

      case   'Rule 32: Definitions':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule32()),
        );
        break;

      case  'Rule 33: Equipment for Sound Signals':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule33()),
        );
        break;

      case  'Rule 34: Manoeuvring and Warning Signals':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule34()),
        );
        break;

      case  'Rule 35: Sound Signals in Restricted Visibility':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule35()),
        );
        break;

      case  'Rule 36: Signals to Attract Attention':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule36()),
        );
        break;

      case  'Rule 37: Distress Signals':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule37()),
        );
        break;

      case 'Rule 38: Exemptions':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule38()),
        );
        break;

      case  'Rule 39: Definitions':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule39()),
        );
        break;

      case  'Rule 40: Application':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule40()),
        );
        break;

      case  'Rule 41: Verification of Compliance':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Rule41()),
        );
        break;

      case  'Annex I':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AnnexI()),
        );
        break;

      case  'Annex II':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AnnexII()),
        );
        break;

      case  'Annex III':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AnnexIII()),
        );
        break;

      case  'Annex IV':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AnnexIV()),
        );
        break;



    // Add cases for other rules and pages here
      default:
        debugPrint('Navigating to $rule');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'COLREGS',
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMainButton('Part A - General', isPartAExpanded, () {
                setState(() {
                  isPartAExpanded = !isPartAExpanded;
                });
              }),
              if (isPartAExpanded) _buildSubButtons(context, [
                'Rule 1: Application',
                'Rule 2: Responsibility',
                'Rule 3: General Definitions'
              ], Colors.blueGrey[700]!, topMargin: 16),

              _buildMainButton('Part B - Steering and Sailing Rules', isPartBExpanded, () {
                setState(() {
                  isPartBExpanded = !isPartBExpanded;
                });
              }),
              if (isPartBExpanded) _buildSteeringAndSailingRules(),

              _buildMainButton('Part C - Lights and Shapes', isPartCExpanded, () {
                setState(() {
                  isPartCExpanded = !isPartCExpanded;
                });
              }),
              if (isPartCExpanded) _buildSubButtons(context, [
                'Rule 20: Application',
                'Rule 21: Definitions',
                'Rule 22: Visibility of Lights',
                'Rule 23: Power-driven Vessels Underway',
                'Rule 24: Towing and Pushing',
                'Rule 25: Sailing Vessels Underway and Vessels Under Oars',
                'Rule 26: Fishing Vessels',
                'Rule 27: Vessels Not Under Command or Restricted in Their Ability to Manoeuvre',
                'Rule 28: Vessels Constrained by Their Draught',
                'Rule 29: Pilot Vessels',
                'Rule 30: Anchored Vessels and Vessels Aground',
                'Rule 31: Seaplanes'
              ], Colors.blueGrey[700]!, topMargin: 16),

              _buildMainButton('Part D - Sound and Light Signals', isPartDExpanded, () {
                setState(() {
                  isPartDExpanded = !isPartDExpanded;
                });
              }),
              if (isPartDExpanded) _buildSubButtons(context, [
                'Rule 32: Definitions',
                'Rule 33: Equipment for Sound Signals',
                'Rule 34: Manoeuvring and Warning Signals',
                'Rule 35: Sound Signals in Restricted Visibility',
                'Rule 36: Signals to Attract Attention',
                'Rule 37: Distress Signals'
              ], Colors.blueGrey[700]!, topMargin: 16),

              _buildMainButton('Part E - Exemptions', isPartEExpanded, () {
                setState(() {
                  isPartEExpanded = !isPartEExpanded;
                });
              }),
              if (isPartEExpanded) _buildSubButtons(context, [
                'Rule 38: Exemptions'
              ], Colors.blueGrey[600]!, topMargin: 16),

              _buildMainButton('Part F - Verification of Compliance', isPartFExpanded, () {
                setState(() {
                  isPartFExpanded = !isPartFExpanded;
                });
              }),
              if (isPartFExpanded) _buildSubButtons(context, [
                'Rule 39: Definitions',
                'Rule 40: Application',
                'Rule 41: Verification of Compliance',
              ], Colors.blueGrey[600]!, topMargin: 16),

              _buildMainButton('Annexes', isPartGExpanded, () {
                setState(() {
                  isPartGExpanded = !isPartGExpanded;
                });
              }),
              if (isPartGExpanded) _buildSubButtons(context, [
                'Annex I',
                'Annex II',
                'Annex III',
                'Annex IV',
              ], Colors.blueGrey[600]!, topMargin: 16),
            ],
          ),
        ),
      ),
    );
  }

  // Build Main Part Button
  Widget _buildMainButton(String title, bool isExpanded, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AutoSizeText(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                maxLines: 1,
                minFontSize: 16,
              ),
            ),
            Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: Colors.white),
          ],
        ),
      ),
    );
  }

  // Build Subsection Rules (Rules in Part A, Part C, etc.)
  Widget _buildSubButtons(BuildContext context, List<String> rules, Color color, {double topMargin = 0}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rules.map((rule) {
        return Container(
          margin: EdgeInsets.only(left: 20, bottom: 8, top: topMargin),
          child: GestureDetector(
            onTap: () {
              _navigateToPage(rule);
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.3),
                    blurRadius: 6.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: AutoSizeText(
                rule,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                maxLines: 2,
                minFontSize: 12,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // Build Nested Subsections for Part B
  Widget _buildSteeringAndSailingRules() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSubSection('Section I - Conduct of Vessels in Any Condition of Visibility', isSectionIExpanded, () {
          setState(() {
            isSectionIExpanded = !isSectionIExpanded;
          });
        }),
        if (isSectionIExpanded)
          _buildSubButtons(context, [
            'Rule 4: Application',
            'Rule 5: Look-out',
            'Rule 6: Safe Speed',
            'Rule 7: Risk of Collision',
            'Rule 8: Action to Avoid Collision',
            'Rule 9: Narrow Channels',
            'Rule 10: Traffic Separation Schemes'
          ], Colors.blueGrey[700]!, topMargin: 16),

        _buildSubSection('Section II - Conduct of Vessels in Sight of One Another', isSectionIIExpanded, () {
          setState(() {
            isSectionIIExpanded = !isSectionIIExpanded;
          });
        }),
        if (isSectionIIExpanded)
          _buildSubButtons(context, [
            'Rule 11: Application',
            'Rule 12: Sailing Vessels',
            'Rule 13: Overtaking',
            'Rule 14: Head-on Situation',
            'Rule 15: Crossing Situation',
            'Rule 16: Action by Give-way Vessel',
            'Rule 17: Action by Stand-on Vessel',
            'Rule 18: Responsibilities Between Vessels'
          ], Colors.blueGrey[700]!, topMargin: 16),

        _buildSubSection('Section III - Conduct of Vessels in Restricted Visibility', isSectionIIIExpanded, () {
          setState(() {
            isSectionIIIExpanded = !isSectionIIIExpanded;
          });
        }),
        if (isSectionIIIExpanded)
          _buildSubButtons(context, [
            'Rule 19: Conduct of Vessels in Restricted Visibility'
          ], Colors.blueGrey[700]!, topMargin: 16),
      ],
    );
  }

  // Build Subsection Button
  Widget _buildSubSection(String title, bool isExpanded, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 12, bottom: 5, top: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AutoSizeText(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                maxLines: 2,
                minFontSize: 14,
              ),
            ),
            Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: Colors.white),
          ],
        ),
      ),
    );
  }
}




// Define other pages for rules similarly
