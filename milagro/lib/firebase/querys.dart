import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:milagro/db/index.dart';
import 'package:milagro/models/ordenTemp.dart';

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
    String nombreVendedor,
    String apellidoVendedor,
    int cantidad,
    String url,
  ) async {
    await firebase.collection('productos').doc().set({
      "nombreProducto": nombreProducto,
      "precio": precio,
      "categoria": categoria,
      "descripcion": descripcion,
      "nombreVendedor": nombreVendedor,
      "apellidoVendedor": apellidoVendedor,
      "cantidad": cantidad,
      "url": url,
    });
  }

  addOrdenTemp(
    String nombreProducto,
    int precio,
    int cantidad,
    String url,
    String uidUsuario,
  ) async {
    List<OrdenTemp> ordenes = await DB().getOrdenTemp();
    DateTime fecha = DateTime.now();

    List<Map<String, dynamic>> productos = [];
    if (ordenes.isNotEmpty) {
      OrdenTemp orden = ordenes.first;

      if (orden.fecha != null) {
        fecha = orden.fecha!;
      }
      for (ProductoOrdenTemp producto in orden.productos) {
        productos.add(producto.toJson());
      }
    }
    productos.add({
      "nombreProducto": nombreProducto,
      "precio": precio,
      "cantidadProducto": cantidad,
      "imagen": url,
    });
    await firebase.collection('ordenesTemp').doc(uidUsuario).set({
      "fecha": DateTime.now(),
      "productos": productos,
      "uidUsuario": uidUsuario,
    });
  }

  addOrden(String direccion, String metodoPago, int total, String idOrden,
      String nombreCompleto) async {
    await firebase.collection('ordenes').doc().set(
      {
        "direccion": direccion,
        "metodoPago": metodoPago,
        "idOrden": idOrden,
        "total": total,
        'nombreCompleto': nombreCompleto,
      },
    );
  }

  eliminarOrdenTemp(String usuarioId) async {
    await FirebaseFirestore.instance
        .collection('ordenesTemp')
        .doc(usuarioId)
        .delete();
  }
}
