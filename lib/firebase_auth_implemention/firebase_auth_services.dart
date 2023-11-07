import 'package:firebase_auth/firebase_auth.dart';

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
        print('The password provided is too weak.');
        return null;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }

    Future<User?> signInWithEmailAndPassword(
        String email, String password) async {
      try {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        return userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          return null;
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          return null;
        }
      } catch (e) {
        print(e);
        return null;
      }
      return null;
    }

    return null;
  }
}
