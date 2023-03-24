import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FireBaseQuery {
  final firebase = FirebaseFirestore.instance;

  registroUsuarioTabla(String correo, String primerNombre, String segundoNombre,
      String primerApellido, String segundoApellido, String rol) async {
    await firebase.collection('usuarios').doc().set({
      "Correo": correo,
      "Primer Nombre": primerNombre,
      "Segundo Nombre": segundoNombre,
      "Primer Apellido": primerApellido,
      "Segundo Apellido": segundoApellido,
      "Rol": rol,
    });
  }
}
