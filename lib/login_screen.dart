import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:polaris_chief_mate/home.dart';
import 'package:polaris_chief_mate/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  final String? userName; // Make userName optional

  const LoginScreen({super.key, this.userName});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  String errorMessage = '';
  bool _obscurePassword = true; // State variable to toggle password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('', style: GoogleFonts.roboto(color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.userName != null && widget.userName!.isNotEmpty
                      ? 'Welcome back, ${widget.userName}'
                      : 'Welcome Back',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 30),
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
                ),
                const SizedBox(height: 20),
                _buildLoginButton(),
                const SizedBox(height: 15),
                if (errorMessage.isNotEmpty)
                  Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.redAccent),
                  ),
                const SizedBox(height: 20),
                _buildForgotPasswordButton(),
                const SizedBox(height: 20),
                _buildSignUpButton(),
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
        obscureText: _obscurePassword,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility : Icons.visibility_off,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
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
          setState(() {
            errorMessage = ''; // Clear previous error messages
          });

          if (email.isEmpty) {
            setState(() {
              errorMessage = 'Please enter your email';
            });
            return;
          }

          if (password.isEmpty) {
            setState(() {
              errorMessage = 'Please enter your password';
            });
            return;
          }

          try {
            final user = await _auth.signInWithEmailAndPassword(
                email: email, password: password);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
                    } catch (e) {
            setState(() {
              errorMessage = 'Invalid email or password';
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
          'Login',
          style: GoogleFonts.playfairDisplay(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return TextButton(
      onPressed: () async {
        if (email.isEmpty) {
          setState(() {
            errorMessage = 'Please enter your email';
          });
          return;
        }

        try {
          await _auth.sendPasswordResetEmail(email: email);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Password reset email sent!'),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
            ),
          );
        } catch (e) {
          String errorMessage;
          if (e is FirebaseAuthException) {
            switch (e.code) {
              case 'invalid-email':
                errorMessage = 'Invalid email address format.';
                break;
              case 'user-not-found':
                errorMessage = 'No user found with this email.';
                break;
              case 'too-many-requests':
                errorMessage = 'Too many requests. Please try again later.';
                break;
              default:
                errorMessage = 'An unexpected error occurred.';
            }
          } else {
            errorMessage = 'An unexpected error occurred.';
          }
          setState(() {
            this.errorMessage = errorMessage;
          });
        }
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.white70,
      ),
      child: Text(
        'Forgot your password?',
        style: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignUpScreen()),
        );
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.white70,
      ),
      child: Text(
        'Don\'t have an account? Sign up',
        style: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
