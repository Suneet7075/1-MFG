import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polaris_chief_mate/fun1/ice_navigation/ice_navigation.dart';
import 'package:polaris_chief_mate/fun1/ror/cards/cards.dart';
import 'package:polaris_chief_mate/fun1/ror/cards/day_signal.dart';
import 'package:polaris_chief_mate/fun1/ror/colregs/colregs.dart';
import 'package:polaris_chief_mate/fun1/electronic_navigation/gps_intro.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  // Store the read status of topics
  Map<String, bool> readStatus = {
    '1. Function 1': false,
    'ROR': false,
    'Colregs': false,
    'Cards': false,
    'Day Signals': false,
    'Situations': false,
    'Electronic Navigation': false,
    'Ice Navigation & Polar Code': false,
    'Gyro Compass': false,
    '2. Function 2': false,
    '3. Function 3': false,
  };

  // Track expanded state for each expansion tile
  Map<String, bool> expandedStatus = {
    '1. Function 1': false,
    'ROR': false,
    'Electronic Navigation': false,
    'Ice Navigation & Polar Code': false,
    '2. Function 2': false,
    '3. Function 3': false,
  };

  bool _expandAll = false; // Track if all are expanded or collapsed

  @override
  void initState() {
    super.initState();
    _loadReadStatus();
  }

  // Load the read status from SharedPreferences
  _loadReadStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      readStatus.forEach((key, value) {
        readStatus[key] = prefs.getBool(key) ?? false;
      });
    });
  }

  // Save the read status to SharedPreferences
  _saveReadStatus(String title, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(title, value);
  }

  // Toggle all expansion tiles
  void _toggleAllExpansionTiles() {
    setState(() {
      _expandAll = !_expandAll; // Toggle the expand/collapse state
      expandedStatus.updateAll((key, value) => _expandAll); // Set all to expand/collapse
    });
  }

  // Calculate completion percentage
  double _calculateCompletionPercentage() {
    int totalTopics = readStatus.length;
    int completedTopics = readStatus.values.where((isRead) => isRead).length;
    return totalTopics > 0 ? (completedTopics / totalTopics) * 100 : 0;
  }

  // Show tips dialog
  void _showTipsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Track your progress', style: TextStyle(color: Colors.green[800])),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('1. Check the box once completed', style: TextStyle(color: Colors.white)),
                Text('2. %age of completion will show at the right top corner', style: TextStyle(color: Colors.white)),
                Text('3. Use drop down to expand the content', style: TextStyle(color: Colors.white)),
                Text('4. Tap on the content to open the page\n\n', style: TextStyle(color: Colors.white)),
                Text('Happy Reading!', style: TextStyle(color: Colors.green[800], fontSize: 25)),
              ],
            ),
          ),
          backgroundColor: Colors.black,
          actions: <Widget>[
            TextButton(
              child: Text('Close', style: TextStyle(color: Colors.green[800])),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double completionPercentage = _calculateCompletionPercentage();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Index',
          style: GoogleFonts.fraunces(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // White back arrow
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Row(
                children: [
                  Container(
                    width: 100, // Adjust width as needed
                    child: LinearProgressIndicator(
                      value: completionPercentage / 100,
                      backgroundColor: Colors.grey[700],
                      color: Colors.green[800],
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '${completionPercentage.toStringAsFixed(0)}%', // Display percentage
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildExpansionTile('1. Function 1', isMainTitle: true, children: [
                    _buildExpansionTile('ROR', isMainTitle: false, children: [
                      _buildListTile('Colregs', Colregs()),
                      _buildListTile('Cards', FlipCardPage()), // Placeholder
                      _buildListTile('Day Signals', DaySignal()), // Placeholder
                      _buildListTile('Situations', GpsIntro()), // Placeholder
                    ]),
                    _buildExpansionTile('Electronic Navigation', isMainTitle: false, children: [
                      _buildListTile('Gyro Compass', GpsIntro()), // Placeholder
                    ]),

                    _buildExpansionTile('Ice Navigation & Polar Code', isMainTitle: false, children: [
                      _buildListTile('Ice Navigation & Polar Code', IceNavigation()), // Placeholder
                    ]),
                  ]),
                  _buildExpansionTile('2. Function 2', isMainTitle: true, children: []),
                  _buildExpansionTile('3. Function 3', isMainTitle: true, children: []),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showTipsDialog,
        child: Icon(Icons.info, color: Colors.green[800],),
        backgroundColor: Colors.black,
      ),
    );
  }

  // Function to build an expansion tile with expand/collapse functionality
  Widget _buildExpansionTile(String title, {required bool isMainTitle, required List<Widget> children}) {
    return ExpansionTile(
      key: PageStorageKey(title), // Helps preserve the state when scrolling
      initiallyExpanded: expandedStatus[title] ?? false,
      title: _buildTitle(title, isMainTitle: isMainTitle),
      children: children,
      onExpansionChanged: (bool expanded) {
        setState(() {
          expandedStatus[title] = expanded;
        });
      },
    );
  }

  // Function to build the title with distinction between main and child titles
  Widget _buildTitle(String title, {required bool isMainTitle}) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: isMainTitle ? 0 : 16.0), // Left padding to align sub-topics
            child: Text(
              title,
              style: TextStyle(
                fontSize: isMainTitle ? 18 : 16, // Larger for main title, smaller for child
                fontWeight: isMainTitle ? FontWeight.bold : FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Checkbox(
          value: readStatus[title],
          onChanged: (bool? value) {
            setState(() {
              readStatus[title] = value ?? false;
              _saveReadStatus(title, value ?? false); // Save status
            });
          },
          activeColor: Colors.green[800],
          checkColor: Colors.black,
        ),
      ],
    );
  }

  // Function to build the ListTile with navigation and checkbox
  Widget _buildListTile(String title, Widget destinationPage) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(left: 32.0), // Left padding for sub-list items
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      trailing: Checkbox(
        value: readStatus[title],
        onChanged: (bool? value) {
          setState(() {
            readStatus[title] = value ?? false;
            _saveReadStatus(title, value ?? false); // Save status
          });
        },
        activeColor: Colors.green[800],
        checkColor: Colors.black,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
    );
  }
}
