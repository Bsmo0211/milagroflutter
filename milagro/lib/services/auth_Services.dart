import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:milagro/pages/Login.dart';
import 'package:milagro/pages/home.dart';

class UserManagement {
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

  signIn(String usuario, String contrasena) {
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: usuario,
      password: contrasena,
    );
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
