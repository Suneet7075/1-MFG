import 'package:firebase_auth/firebase_auth.dart';

class HelperFunctions {
  static Future<bool> getUserLoggedInStatus() async {
    final User? user = FirebaseAuth.instance.currentUser;
    return user != null;



  }

}
