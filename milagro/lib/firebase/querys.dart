import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FireBaseQuery {
  final firebase = FirebaseFirestore.instance;

  registroUsuarioTabla(
    String correo,
    String primerNombre,
    String segundoNombre,
    String primerApellido,
    String segundoApellido,
    String rol,
    String direccion,
  ) async {
    await firebase.collection('usuarios').doc().set({
      "correo": correo,
      "primerNombre": primerNombre,
      "segundoNombre": segundoNombre,
      "primerApellido": primerApellido,
      "segundoApellido": segundoApellido,
      "rol": rol,
      "direccion": direccion,
    });
  }

  addProducto(
    String nombreProducto,
    int precio,
    String categoria,
    String descripcion,
    DateTime fechaInicio,
    DateTime fechaFinal,
    String nombreVendedor,
    String apellidoVendedor,
    int cantidad,
  ) async {
    await firebase.collection('productos').doc().set({
      "nombreProducto": nombreProducto,
      "precio": precio,
      "categoria": categoria,
      "descripcion": descripcion,
      "fechaInicio": fechaInicio,
      "fechaFinal": fechaFinal,
      "nombreVendedor": nombreVendedor,
      "apellidoVendedor": apellidoVendedor,
      "cantidad": cantidad
    });
  }
}
