import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polaris_chief_mate/home.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

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
      duration: const Duration(seconds: 2),
    );
    _animation = CurvedAnimation(parent: _controller!, curve: Curves.easeInOut);

    _controller!.forward();

    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 5)); // Adjust delay as needed
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AuthChecker()), // Navigate to AuthChecker
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
      body: Stack(
        children: [
          // Polaris and Chief Mate (1MFG) text in the center
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Polaris text
                Text(
                  'Polaris',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 60,
                    color: Colors.white,
                    shadows: [
                      const Shadow(
                        blurRadius: 20.0,
                        color: Colors.deepOrange,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // 1MFG animated text
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
                    '1MFG', // Changed to '1MFG' as per your request
                    style: GoogleFonts.dmSerifText(
                      color: Colors.white70,
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      shadows: [
                        const Shadow(
                          blurRadius: 5.0,
                          color: Colors.black45,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // "From Polaris 2MFG maker" at the bottom center
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Text(
              'Another small effort from the maker of Polaris 2MFG', // Small text at the bottom
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSerifText(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w300,
                shadows: [
                  const Shadow(
                    blurRadius: 5.0,
                    color: Colors.black45,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());  // Show loading while checking auth state
        } else if (snapshot.hasData) {
          return const Home();  // User is signed in, navigate to Home screen
        } else {
          return const LoginScreen();  // User is not signed in, navigate to Login screen
        }
      },
    );
  }
}
