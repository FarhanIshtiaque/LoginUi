import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentification {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> firebaseSignup(String email, String password) async {
    try {
      UserCredential newuser = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return newuser;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserCredential> loginUsernamePassword(
      String email, String password) async {
    try {
      UserCredential _user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return _user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );
        return Future.value(true);
      }
    } else {
      throw FirebaseAuthException(
        message: "Sign in aborded by user",
        code: "ERROR_ABORDER_BY_USER",
      );
    }
    return Future.value(false);
  }

  // Future<bool> signInWithFacebook() async {
  // final facebookLogin = FacebookLogin();
// final result = await facebookLogin.logInWithReadPermissions(['email']);

  // if (googleUser != null) {
  //   final googleAuth = await googleUser.authentication;
  //   if (googleAuth.idToken != null) {
  //     await _firebaseAuth.signInWithCredential(
  //       GoogleAuthProvider.credential(
  //           idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
  //     );
  //     return Future.value(true);
  //   }
  // } else {
  //   throw FirebaseAuthException(
  //     message: "Sign in aborded by user",
  //     code: "ERROR_ABORDER_BY_USER",
  //   );
  // }
  // return Future.value(false);
  // }

  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }

  User logedUser() {
    User user = _firebaseAuth.currentUser;
    // User user = null;
    if (user != null) {
      // print('${user.email}=====================');
      return user;
    } else {
      print('null user found---------------------------');
      return null;
    }
  }
}
