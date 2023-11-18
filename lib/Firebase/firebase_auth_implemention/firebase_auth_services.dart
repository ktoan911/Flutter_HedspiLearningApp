// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hedspi_learningapp/ProfileData.dart';

class FireBaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return null;
      } else if (e.code == 'email-already-in-use') {
        errorLogin = 'Email already in use! Please try again';
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<User?> logInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
      } else {
        errorLogin = 'Email or password is incorrect';
        print(e);
      }
    }
    return null;
  }
}
