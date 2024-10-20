import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DaySignal extends StatefulWidget {
  @override
  _DaySigna createState() => _DaySigna();
}

class _DaySigna extends State<DaySignal> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this); // Increased length to 4 for Set 4
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
          'Day Signals',
          style: GoogleFonts.playfairDisplay(color: Colors.black), // White text color
        ),
        backgroundColor: Colors.white, // Black background color
        iconTheme: IconThemeData(
          color: Colors.black, // White icons
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: ''),

          ],
          indicatorColor: Colors.black, // Customize the indicator color
        ),
        actions: [
          Row(
            children: [
              Text(
                'Tap to Flip',
                style: TextStyle(color: Colors.black),
              ),
              IconButton(
                icon: Icon(Icons.flip, color: Colors.black),
                onPressed: () {
                  // Flip action can be defined here if needed
                },
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.white, // Set the background color to black
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
                    padding: const EdgeInsets.only(top: 40), // Adjust top padding to shift content downward
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day1.png',
                          backImageUrl: 'images/fun1/cards/day1A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day2.png',
                          backImageUrl: 'images/fun1/cards/day2A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day3.png',
                          backImageUrl: 'images/fun1/cards/day3A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day4.png',
                          backImageUrl: 'images/fun1/cards/day4A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day5.png',
                          backImageUrl: 'images/fun1/cards/day5A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day6.png',
                          backImageUrl: 'images/fun1/cards/day6A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day7.png',
                          backImageUrl: 'images/fun1/cards/day7A.png',
                        ),

                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day9.png',
                          backImageUrl: 'images/fun1/cards/day9A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day11.png',
                          backImageUrl: 'images/fun1/cards/day11A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day12.png',
                          backImageUrl: 'images/fun1/cards/day12A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day13.png',
                          backImageUrl: 'images/fun1/cards/day13A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day14.png',
                          backImageUrl: 'images/fun1/cards/day14A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day15.png',
                          backImageUrl: 'images/fun1/cards/day15A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day16.png',
                          backImageUrl: 'images/fun1/cards/day16A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day17.png',
                          backImageUrl: 'images/fun1/cards/day17A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day18.png',
                          backImageUrl: 'images/fun1/cards/day18A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day19.png',
                          backImageUrl: 'images/fun1/cards/day19A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day20.png',
                          backImageUrl: 'images/fun1/cards/day20A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day21.png',
                          backImageUrl: 'images/fun1/cards/day21A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day22.png',
                          backImageUrl: 'images/fun1/cards/day22A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day23.png',
                          backImageUrl: 'images/fun1/cards/day23A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day24.png',
                          backImageUrl: 'images/fun1/cards/day24A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day25.png',
                          backImageUrl: 'images/fun1/cards/day25A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day26.png',
                          backImageUrl: 'images/fun1/cards/day26A.png',
                        ),

                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day28.png',
                          backImageUrl: 'images/fun1/cards/day28A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day29.png',
                          backImageUrl: 'images/fun1/cards/day29A.png',
                        ),
                        SizedBox(height: 20),
                        FlipCard(
                          frontImageUrl: 'images/fun1/cards/day30.png',
                          backImageUrl: 'images/fun1/cards/day30A.png',
                        ),




                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Content for Set 2

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
