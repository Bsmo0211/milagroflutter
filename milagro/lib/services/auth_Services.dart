import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  Future<dynamic> signIn(
      BuildContext ctx, String usuario, String contrasena) async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: usuario,
      password: contrasena,
    );

    User? usuarioTemp = user.user;

    redireccion(ctx, usuarioTemp);
  }

  createAccount(String email, String contrasena) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: contrasena);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  redireccion(BuildContext context, User? user) async {
    // final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('/usuarios')
          .where('Correo', isEqualTo: user.email)
          .get();

      // print(snapshot);

      if (snapshot.docs.isNotEmpty) {
        final userData = snapshot.docs.first.data();
        print(userData);
        final userRole = userData['Rol'];
        if (userRole == 'Comprador') {
          /* Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const Login(),
          )); */

          print('comprador');
        }
        if (userRole == 'Administrador') {
          /* Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const Login(),
          )); */
          print('Administrador');
        }
        if (userRole == 'Agricultor') {
          /*  Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const Login(),
          )); */
          print('Agricultor');
        }
      } else {
        print('No se encontró información del usuario en Firestore');
      }
    } catch (e) {
      print('Ocurrió un error al obtener los datos del usuario: $e');
    }
  }
}
