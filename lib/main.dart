import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:polaris_chief_mate/home.dart';
import 'package:polaris_chief_mate/login_screen.dart';
import 'package:polaris_chief_mate/splash_screen.dart';
import 'helper_function.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<bool> _isSignedInFuture;

  @override
  void initState() {
    super.initState();
    _isSignedInFuture = HelperFunctions.getUserLoggedInStatus();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: _isSignedInFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show splash screen while checking sign-in status
            return const SplashScreen();
          } else if (snapshot.hasData && snapshot.data == true) {
            // User is signed in, go to Home screen
            return const SplashScreen();
          } else {
            // User is not signed in, go to LoginScreen
            return const SplashScreen();
          }
        },
      ),
    );
  }
}
