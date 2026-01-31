import 'package:firebase_auth/firebase_auth.dart';

class AuthServicesClass {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<UserCredential?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print('Error during sign in: $e');
      return null;
    }
  }
}
