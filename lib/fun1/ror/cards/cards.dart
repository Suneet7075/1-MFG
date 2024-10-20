import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlipCardPage extends StatefulWidget {
  @override
  _FlipCardPageState createState() => _FlipCardPageState();
}

class _FlipCardPageState extends State<FlipCardPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this); // Increased length to 4 for Set 4
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose of TabController
    _scrollController.dispose(); // Dispose of ScrollController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ROR Cards',
          style: GoogleFonts.playfairDisplay(color: Colors.white), // White text color
        ),
        backgroundColor: Colors.black, // Black background color
        iconTheme: IconThemeData(
          color: Colors.white, // White icons
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Set 1'),
            Tab(text: 'Set 2'),
            Tab(text: 'Set 3'),
            Tab(text: 'Set 4'),
            Tab(text: 'Set 5'),
          ],
          indicatorColor: Colors.white, // Customize the indicator color
        ),
        actions: [
          Row(
            children: [
              Text(
                'Tap to Flip',
                style: TextStyle(color: Colors.white),
              ),
              IconButton(
                icon: Icon(Icons.flip, color: Colors.white),
                onPressed: () {
                  // Flip action can be defined here if needed
                },
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.black, // Set the background color to black
      body: TabBarView(
        controller: _tabController,
        children: [
          // Content for Set 1
          Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50), // Adjust top padding to shift content downward
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card1.png',
                          backImageUrl: 'images/fun1/cards/card1A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card2.png',
                          backImageUrl: 'images/fun1/cards/card2A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card3.png',
                          backImageUrl: 'images/fun1/cards/card3A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card4.png',
                          backImageUrl: 'images/fun1/cards/card4A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card5.png',
                          backImageUrl: 'images/fun1/cards/card5A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card6.png',
                          backImageUrl: 'images/fun1/cards/card6A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card7.png',
                          backImageUrl: 'images/fun1/cards/card7A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card8.png',
                          backImageUrl: 'images/fun1/cards/card8A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card9.png',
                          backImageUrl: 'images/fun1/cards/card9A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card10.png',
                          backImageUrl: 'images/fun1/cards/card10A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card11.png',
                          backImageUrl: 'images/fun1/cards/card11A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card12.png',
                          backImageUrl: 'images/fun1/cards/card12A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card13.png',
                          backImageUrl: 'images/fun1/cards/card13A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card14.png',
                          backImageUrl: 'images/fun1/cards/card14A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card15.png',
                          backImageUrl: 'images/fun1/cards/card15A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card16.png',
                          backImageUrl: 'images/fun1/cards/card16A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card17.png',
                          backImageUrl: 'images/fun1/cards/card17A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card18.png',
                          backImageUrl: 'images/fun1/cards/card18A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card19.png',
                          backImageUrl: 'images/fun1/cards/card19A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card20.png',
                          backImageUrl: 'images/fun1/cards/card20A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card21.png',
                          backImageUrl: 'images/fun1/cards/card21A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card22.png',
                          backImageUrl: 'images/fun1/cards/card22A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card23.png',
                          backImageUrl: 'images/fun1/cards/card23A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card24.png',
                          backImageUrl: 'images/fun1/cards/card24A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card25.png',
                          backImageUrl: 'images/fun1/cards/card25A.png',
                        ),

                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card26.png',
                          backImageUrl: 'images/fun1/cards/card26A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card27.png',
                          backImageUrl: 'images/fun1/cards/card27A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card28.png',
                          backImageUrl: 'images/fun1/cards/card28A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card29.png',
                          backImageUrl: 'images/fun1/cards/card29A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card30.png',
                          backImageUrl: 'images/fun1/cards/card30A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card31.png',
                          backImageUrl: 'images/fun1/cards/card31A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card32.png',
                          backImageUrl: 'images/fun1/cards/card32A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card33.png',
                          backImageUrl: 'images/fun1/cards/card33A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card34.png',
                          backImageUrl: 'images/fun1/cards/card34A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card35.png',
                          backImageUrl: 'images/fun1/cards/card35A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card36.png',
                          backImageUrl: 'images/fun1/cards/card36A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card37.png',
                          backImageUrl: 'images/fun1/cards/card37A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card38.png',
                          backImageUrl: 'images/fun1/cards/card38A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card39.png',
                          backImageUrl: 'images/fun1/cards/card39A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card40.png',
                          backImageUrl: 'images/fun1/cards/card40A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card41.png',
                          backImageUrl: 'images/fun1/cards/card41A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card42.png',
                          backImageUrl: 'images/fun1/cards/card42A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card43.png',
                          backImageUrl: 'images/fun1/cards/card43A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card44.png',
                          backImageUrl: 'images/fun1/cards/card44A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card45.png',
                          backImageUrl: 'images/fun1/cards/card45A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card46.png',
                          backImageUrl: 'images/fun1/cards/card46A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card48.png',
                          backImageUrl: 'images/fun1/cards/card48A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card49.png',
                          backImageUrl: 'images/fun1/cards/card49A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card50.png',
                          backImageUrl: 'images/fun1/cards/card50A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card51.png',
                          backImageUrl: 'images/fun1/cards/card51A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card52.png',
                          backImageUrl: 'images/fun1/cards/card52A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card54.png',
                          backImageUrl: 'images/fun1/cards/card54A.png',
                        ),



                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Content for Set 2
          Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30), // Adjust top padding to shift content downward
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card55.png',
                          backImageUrl: 'images/fun1/cards/card55A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card56.png',
                          backImageUrl: 'images/fun1/cards/card56A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card57.png',
                          backImageUrl: 'images/fun1/cards/card57A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card58.png',
                          backImageUrl: 'images/fun1/cards/card58A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card59.png',
                          backImageUrl: 'images/fun1/cards/card59A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card60.png',
                          backImageUrl: 'images/fun1/cards/card60A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card61.png',
                          backImageUrl: 'images/fun1/cards/card61A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card62.png',
                          backImageUrl: 'images/fun1/cards/card62A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card63.png',
                          backImageUrl: 'images/fun1/cards/card63A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card65.png',
                          backImageUrl: 'images/fun1/cards/card65A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card66.png',
                          backImageUrl: 'images/fun1/cards/card66A.png',
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Content for Set 3
          Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30), // Adjust top padding to shift content downward
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card67.png',
                          backImageUrl: 'images/fun1/cards/card67A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card68.png',
                          backImageUrl: 'images/fun1/cards/card68A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card69.png',
                          backImageUrl: 'images/fun1/cards/card69A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card70.png',
                          backImageUrl: 'images/fun1/cards/card70A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card71.png',
                          backImageUrl: 'images/fun1/cards/card71A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card72.png',
                          backImageUrl: 'images/fun1/cards/card72A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card73.png',
                          backImageUrl: 'images/fun1/cards/card73A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card74.png',
                          backImageUrl: 'images/fun1/cards/card74A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card75.png',
                          backImageUrl: 'images/fun1/cards/card75A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card76.png',
                          backImageUrl: 'images/fun1/cards/card76A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card77.png',
                          backImageUrl: 'images/fun1/cards/card77A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card78.png',
                          backImageUrl: 'images/fun1/cards/card78A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card79.png',
                          backImageUrl: 'images/fun1/cards/card79A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card80.png',
                          backImageUrl: 'images/fun1/cards/card80A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card81.png',
                          backImageUrl: 'images/fun1/cards/card81A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card82.png',
                          backImageUrl: 'images/fun1/cards/card82A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card83.png',
                          backImageUrl: 'images/fun1/cards/card83A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card84.png',
                          backImageUrl: 'images/fun1/cards/card84A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card85.png',
                          backImageUrl: 'images/fun1/cards/card85A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card86.png',
                          backImageUrl: 'images/fun1/cards/card86A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card87.png',
                          backImageUrl: 'images/fun1/cards/card87A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card88.png',
                          backImageUrl: 'images/fun1/cards/card88A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card89.png',
                          backImageUrl: 'images/fun1/cards/card89A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card90.png',
                          backImageUrl: 'images/fun1/cards/card90A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card91.png',
                          backImageUrl: 'images/fun1/cards/card91A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card92.png',
                          backImageUrl: 'images/fun1/cards/card92A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card93.png',
                          backImageUrl: 'images/fun1/cards/card93A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card94.png',
                          backImageUrl: 'images/fun1/cards/card94A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card95.png',
                          backImageUrl: 'images/fun1/cards/card95A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card96.png',
                          backImageUrl: 'images/fun1/cards/card96A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card97.png',
                          backImageUrl: 'images/fun1/cards/card97A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card98.png',
                          backImageUrl: 'images/fun1/cards/card98A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card99.png',
                          backImageUrl: 'images/fun1/cards/card99A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card100.png',
                          backImageUrl: 'images/fun1/cards/card100A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card101.png',
                          backImageUrl: 'images/fun1/cards/card101A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card102.png',
                          backImageUrl: 'images/fun1/cards/card102A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card103.png',
                          backImageUrl: 'images/fun1/cards/card103A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card104.png',
                          backImageUrl: 'images/fun1/cards/card104A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card105.png',
                          backImageUrl: 'images/fun1/cards/card105A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card106.png',
                          backImageUrl: 'images/fun1/cards/card106A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card107.png',
                          backImageUrl: 'images/fun1/cards/card107A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card108.png',
                          backImageUrl: 'images/fun1/cards/card108A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card109.png',
                          backImageUrl: 'images/fun1/cards/card109A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card110.png',
                          backImageUrl: 'images/fun1/cards/card110A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card111.png',
                          backImageUrl: 'images/fun1/cards/card111A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card112.png',
                          backImageUrl: 'images/fun1/cards/card112A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card113.png',
                          backImageUrl: 'images/fun1/cards/card113A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card114.png',
                          backImageUrl: 'images/fun1/cards/card114A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card115.png',
                          backImageUrl: 'images/fun1/cards/card115A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card116.png',
                          backImageUrl: 'images/fun1/cards/card116A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card117.png',
                          backImageUrl: 'images/fun1/cards/card117A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card118.png',
                          backImageUrl: 'images/fun1/cards/card118A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card119.png',
                          backImageUrl: 'images/fun1/cards/card119A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card120.png',
                          backImageUrl: 'images/fun1/cards/card120A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card121.png',
                          backImageUrl: 'images/fun1/cards/card121A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card122.png',
                          backImageUrl: 'images/fun1/cards/card122A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card123.png',
                          backImageUrl: 'images/fun1/cards/card123A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card124.png',
                          backImageUrl: 'images/fun1/cards/card124A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card125.png',
                          backImageUrl: 'images/fun1/cards/card125A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card126.png',
                          backImageUrl: 'images/fun1/cards/card126A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card127.png',
                          backImageUrl: 'images/fun1/cards/card127A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card128.png',
                          backImageUrl: 'images/fun1/cards/card128A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card129.png',
                          backImageUrl: 'images/fun1/cards/card129A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card130.png',
                          backImageUrl: 'images/fun1/cards/card130A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card131.png',
                          backImageUrl: 'images/fun1/cards/card131A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card132.png',
                          backImageUrl: 'images/fun1/cards/card132A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card133.png',
                          backImageUrl: 'images/fun1/cards/card133A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card134.png',
                          backImageUrl: 'images/fun1/cards/card134A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card135.png',
                          backImageUrl: 'images/fun1/cards/card135A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card136.png',
                          backImageUrl: 'images/fun1/cards/card136A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card137.png',
                          backImageUrl: 'images/fun1/cards/card137A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card138.png',
                          backImageUrl: 'images/fun1/cards/card138A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card139.png',
                          backImageUrl: 'images/fun1/cards/card139A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card140.png',
                          backImageUrl: 'images/fun1/cards/card140A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card141.png',
                          backImageUrl: 'images/fun1/cards/card141A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card142.png',
                          backImageUrl: 'images/fun1/cards/card142A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card143.png',
                          backImageUrl: 'images/fun1/cards/card143A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card144.png',
                          backImageUrl: 'images/fun1/cards/card144A.png',
                        ),



                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Content for Set 4
          Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30), // Adjust top padding to shift content downward
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card145.png',
                          backImageUrl: 'images/fun1/cards/card145A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card146.png',
                          backImageUrl: 'images/fun1/cards/card146A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card147.png',
                          backImageUrl: 'images/fun1/cards/card147A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card148.png',
                          backImageUrl: 'images/fun1/cards/card148A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card149.png',
                          backImageUrl: 'images/fun1/cards/card149A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card150.png',
                          backImageUrl: 'images/fun1/cards/card150A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card151.png',
                          backImageUrl: 'images/fun1/cards/card151A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card152.png',
                          backImageUrl: 'images/fun1/cards/card152A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card153.png',
                          backImageUrl: 'images/fun1/cards/card153A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card154.png',
                          backImageUrl: 'images/fun1/cards/card154A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card155.png',
                          backImageUrl: 'images/fun1/cards/card155A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card156.png',
                          backImageUrl: 'images/fun1/cards/card156A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card157.png',
                          backImageUrl: 'images/fun1/cards/card157A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card158.png',
                          backImageUrl: 'images/fun1/cards/card158A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card159.png',
                          backImageUrl: 'images/fun1/cards/card159A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card160.png',
                          backImageUrl: 'images/fun1/cards/card160A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card161.png',
                          backImageUrl: 'images/fun1/cards/card161A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card162.png',
                          backImageUrl: 'images/fun1/cards/card162A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card163.png',
                          backImageUrl: 'images/fun1/cards/card163A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card164.png',
                          backImageUrl: 'images/fun1/cards/card164A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card165.png',
                          backImageUrl: 'images/fun1/cards/card165A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card166.png',
                          backImageUrl: 'images/fun1/cards/card166A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card167.png',
                          backImageUrl: 'images/fun1/cards/card167A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card168.png',
                          backImageUrl: 'images/fun1/cards/card168A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card169.png',
                          backImageUrl: 'images/fun1/cards/card169A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card170.png',
                          backImageUrl: 'images/fun1/cards/card170A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card171.png',
                          backImageUrl: 'images/fun1/cards/card171A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card172.png',
                          backImageUrl: 'images/fun1/cards/card172A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card173.png',
                          backImageUrl: 'images/fun1/cards/card173A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card174.png',
                          backImageUrl: 'images/fun1/cards/card174A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card175.png',
                          backImageUrl: 'images/fun1/cards/card175A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card176.png',
                          backImageUrl: 'images/fun1/cards/card176A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card177.png',
                          backImageUrl: 'images/fun1/cards/card177A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card178.png',
                          backImageUrl: 'images/fun1/cards/card178A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card179.png',
                          backImageUrl: 'images/fun1/cards/card179A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card180.png',
                          backImageUrl: 'images/fun1/cards/card180A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card181.png',
                          backImageUrl: 'images/fun1/cards/card181A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card182.png',
                          backImageUrl: 'images/fun1/cards/card182A.png',
                        ),

                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card191.png',
                          backImageUrl: 'images/fun1/cards/card191A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card192.png',
                          backImageUrl: 'images/fun1/cards/card192A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card193.png',
                          backImageUrl: 'images/fun1/cards/card193A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card194.png',
                          backImageUrl: 'images/fun1/cards/card194A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card195.png',
                          backImageUrl: 'images/fun1/cards/card195A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card196.png',
                          backImageUrl: 'images/fun1/cards/card196A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card197.png',
                          backImageUrl: 'images/fun1/cards/card197A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card198.png',
                          backImageUrl: 'images/fun1/cards/card198A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card199.png',
                          backImageUrl: 'images/fun1/cards/card199A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card200.png',
                          backImageUrl: 'images/fun1/cards/card200A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card201.png',
                          backImageUrl: 'images/fun1/cards/card201A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card202.png',
                          backImageUrl: 'images/fun1/cards/card202A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card203.png',
                          backImageUrl: 'images/fun1/cards/card203A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card204.png',
                          backImageUrl: 'images/fun1/cards/card204A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card205.png',
                          backImageUrl: 'images/fun1/cards/card205A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card206.png',
                          backImageUrl: 'images/fun1/cards/card206A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card207.png',
                          backImageUrl: 'images/fun1/cards/card207A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card208.png',
                          backImageUrl: 'images/fun1/cards/card208A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card209.png',
                          backImageUrl: 'images/fun1/cards/card209A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card210.png',
                          backImageUrl: 'images/fun1/cards/card210A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card211.png',
                          backImageUrl: 'images/fun1/cards/card211A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card212.png',
                          backImageUrl: 'images/fun1/cards/card212A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card213.png',
                          backImageUrl: 'images/fun1/cards/card213A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card214.png',
                          backImageUrl: 'images/fun1/cards/card214A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card215.png',
                          backImageUrl: 'images/fun1/cards/card215A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card216.png',
                          backImageUrl: 'images/fun1/cards/card216A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card217.png',
                          backImageUrl: 'images/fun1/cards/card217A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card218.png',
                          backImageUrl: 'images/fun1/cards/card218A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card219.png',
                          backImageUrl: 'images/fun1/cards/card219A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card220.png',
                          backImageUrl: 'images/fun1/cards/card220A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card221.png',
                          backImageUrl: 'images/fun1/cards/card221A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card222.png',
                          backImageUrl: 'images/fun1/cards/card222A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card223.png',
                          backImageUrl: 'images/fun1/cards/card223A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card224.png',
                          backImageUrl: 'images/fun1/cards/card224A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card225.png',
                          backImageUrl: 'images/fun1/cards/card225A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card226.png',
                          backImageUrl: 'images/fun1/cards/card226A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card227.png',
                          backImageUrl: 'images/fun1/cards/card227A.png',
                        ),



                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30), // Adjust top padding to shift content downward
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card228.png',
                          backImageUrl: 'images/fun1/cards/card228A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card229.png',
                          backImageUrl: 'images/fun1/cards/card229A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card230.png',
                          backImageUrl: 'images/fun1/cards/card230A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card231.png',
                          backImageUrl: 'images/fun1/cards/card231A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card232.png',
                          backImageUrl: 'images/fun1/cards/card232A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card233.png',
                          backImageUrl: 'images/fun1/cards/card233A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card234.png',
                          backImageUrl: 'images/fun1/cards/card234A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/card235.png',
                          backImageUrl: 'images/fun1/cards/card235A.png',
                        ),



                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FlipCard extends StatefulWidget {
  final String frontImageUrl;
  final String backImageUrl;

  FlipCard({required this.frontImageUrl, required this.backImageUrl});

  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  void _flipCard() {
    setState(() {
      if (_isFront) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      _isFront = !_isFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final angle = _animation.value * 3.14; // 180 degrees in radians
          final isUnder = _animation.value > 0.5;
          final transform = Matrix4.rotationY(angle);
          transform.setEntry(3, 2, 0.001); // Add perspective

          return Transform(
            transform: transform,
            alignment: Alignment.center,
            
            child: isUnder
                ? Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(3.14), // Flip horizontally
              child: Image.asset(
                widget.backImageUrl,
                fit: BoxFit.cover,
              ),
            )
                : Image.asset(
              widget.frontImageUrl,
              fit: BoxFit.cover,
            ),

          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
