import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'login_screen.dart'; // Import the LoginScreen
import 'package:google_fonts/google_fonts.dart'; // Ensure Google Fonts is imported

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String errorMessage = '';
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Sign Up', style: GoogleFonts.roboto(color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTextField(
                  hintText: 'Enter your name',
                  obscureText: false,
                  onChanged: (value) {
                    name = value;
                  },
                ),
                const SizedBox(height: 15),
                _buildTextField(
                  hintText: 'Enter your email',
                  obscureText: false,
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(height: 15),
                _buildPasswordTextField(
                  hintText: 'Enter your password',
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: _obscurePassword,
                  onToggleVisibility: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                const SizedBox(height: 15),
                _buildPasswordTextField(
                  hintText: 'Confirm your password',
                  onChanged: (value) {
                    confirmPassword = value;
                  },
                  obscureText: _obscureConfirmPassword,
                  onToggleVisibility: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
                const SizedBox(height: 20),
                _buildSignUpButton(),
                const SizedBox(height: 20),
                _buildGoogleSignInButton(),
                const SizedBox(height: 15),
                Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 20),
                _buildLoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required bool obscureText,
    required Function(String) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        keyboardType: obscureText ? TextInputType.visiblePassword : TextInputType.emailAddress,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField({
    required String hintText,
    required Function(String) onChanged,
    required bool obscureText,
    required VoidCallback onToggleVisibility,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.white,
            ),
            onPressed: onToggleVisibility,
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.6),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () async {
          if (password == confirmPassword) {
            try {
              final user = await _auth.createUserWithEmailAndPassword(
                  email: email, password: password);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(userName: name),
                ),
              );
                        } catch (e) {
              setState(() {
                errorMessage = e is FirebaseAuthException
                    ? e.message ?? 'An error occurred during sign-up.'
                    : 'An error occurred: ${e.toString()}';
              });
            }
          } else {
            setState(() {
              errorMessage = 'Passwords do not match';
            });
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Sign Up',
          style: GoogleFonts.playfairDisplay(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildGoogleSignInButton() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.6),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: () async {
          try {
            final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
            if (googleUser == null) {
              // User canceled the sign-in
              return;
            }
            final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
            final AuthCredential credential = GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken,
              idToken: googleAuth.idToken,
            );
            final UserCredential userCredential = await _auth.signInWithCredential(credential);
            if (userCredential.user != null) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(userName: googleUser.displayName),
                ),
              );
            }
          } catch (e) {
            setState(() {
              errorMessage = e is FirebaseAuthException
                  ? e.message ?? 'Failed to sign in with Google.'
                  : 'An error occurred during Google sign-in: ${e.toString()}';
            });
            // Optionally log more details for debugging
            print('Error during Google sign-in: ${e.toString()}');
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        icon: Image.network(
            'http://pngimg.com/uploads/google/google_PNG19635.png', width: 25, height: 25),
        label: Text(
          'Sign in with Google',
          style: GoogleFonts.playfairDisplay(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.white70,
      ),
      child: Text(
        'Already have an account? Login',
        style: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
