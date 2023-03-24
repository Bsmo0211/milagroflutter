import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:milagro/pages/Login.dart';
import 'package:milagro/pages/home.dart';

class AuthServices {
  Widget handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Home();
        } else {
          return const Login();
        }
      },
    );
  }

  singInWithGoogle() async {
    if (FirebaseAuth.instance.currentUser == null) {
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn(scopes: <String>['email']).signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } else {
      return FirebaseAuth.instance.currentUser;
    }
  }

  signIn(String usuario, String contrasena) {
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: usuario,
      password: contrasena,
    );
  }

  createAccount(String email, String contrasena) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: contrasena);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
