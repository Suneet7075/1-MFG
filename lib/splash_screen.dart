import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polaris_chief_mate/home.dart';
import 'login_screen.dart';
import 'fun.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = CurvedAnimation(parent: _controller!, curve: Curves.easeInOut);

    _controller!.forward();

    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 5)); // Adjust delay as needed
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AuthChecker()), // Navigate to AuthChecker
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Remove the animated logo
            SizedBox(height: 20),
            // "Polaris" text with elegant font and glow effect
            Text(
              'Polaris',
              style: GoogleFonts.playfairDisplay(
                fontSize: 60,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 20.0,
                    color: Colors.deepOrange,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Animated "Chief Mate" text with opacity and slide effect
            AnimatedBuilder(
              animation: _animation!,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, (1 - _animation!.value) * 20),
                  child: Opacity(
                    opacity: _animation!.value,
                    child: child,
                  ),
                );
              },
              child: Text(
                'Chief Mate',
                style: GoogleFonts.dmSerifText(
                  color: Colors.white70,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.black45,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            // Stylish loading indicator
            CircularProgressIndicator(
              color: Colors.deepOrangeAccent,
              strokeWidth: 3.0,
            ),
          ],
        ),
      ),
    );
  }
}

class AuthChecker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());  // Show loading while checking auth state
        } else if (snapshot.hasData) {
          return Home();  // User is signed in, navigate to Function I screen
        } else {
          return LoginScreen();  // User is not signed in, navigate to Login screen
        }
      },
    );
  }
}
