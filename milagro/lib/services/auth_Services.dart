import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:milagro/pages/Login.dart';
import 'package:milagro/pages/vendedor.dart';
import 'package:milagro/pages/compras.dart';
import 'package:milagro/pages/home_administrador.dart';
import 'package:milagro/pages/pantalla_carga.dart';

class AuthServices {
  Widget handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Muestra una pantalla de carga mientras se espera la respuesta de Firebase.
          return const PantallaCarga();
        }
        if (snapshot.hasData) {
          // Usuario autenticado. Obtiene el widget adecuado.
          return getAuthWidget(snapshot.data?.email ?? '');
        } else {
          // Usuario no autenticado. Muestra la pantalla de inicio de sesión.
          return const Login();
        }
      },
    );
  }

  Widget getAuthWidget(String email) {
    // Realiza la lógica de autenticación y devuelve el widget adecuado.
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance
          .collection('/usuarios')
          .where('correo', isEqualTo: email)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Muestra una pantalla de carga mientras se espera la respuesta de Firestore.
          return const PantallaCarga();
        }
        if (snapshot.hasData) {
          // Obtener el documento de usuario
          final userDocument = snapshot.data!.docs.first;
          Object? user = userDocument.data();
          String? rol = (user as Map<String, dynamic>)!['rol'];
          /* print(userData); */
          // final userRole = (userData)['Rol'];
          return widgetByRol(rol, context);
          // Devolver la pantalla de Compras
        } else {
          // Devolver la pantalla de Inicio
          return const Home();
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

  createAccount(String email, String contrasena) async {
    await FirebaseAuth.instance
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
        /* print(userData); */
        final userRole = userData['Rol'];
        if (userRole == 'Comprador') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const Compras(),
          ));
        }
        if (userRole == 'Administrador') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const Home(),
          ));
        }
        if (userRole == 'Agricultor') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const Vendedor(),
          ));
        }
        if (userRole == 'Centro acopio') {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const Vendedor(),
          ));
        }
      } else {
        print('No se encontró información del usuario en Firestore');
      }
    } catch (e) {
      print('Ocurrió un error al obtener los datos del usuario: $e');
    }
  }

  Widget widgetByRol(String? rol, BuildContext context) {
    if (rol == 'Comprador') {
      return const Compras();
    } else if (rol == 'Administrador') {
      return const Home();
    } else if (rol == 'Agricultor') {
      return const Vendedor();
    } else if (rol == 'Centro acopio') {
      return const Vendedor();
    }

    return const Login();
  }
}
