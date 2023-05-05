//import 'dart:html';

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:milagro/db/index.dart';

class ProductoProvider extends ChangeNotifier {
  ProductoProvider() {
    cargarProductos();
  }
  List<Producto> productos = [];
  cargarProductos() async {
    productos = await DB().getProductos();

    notifyListeners();
  }
}

class Producto {
  String? nombreProducto = "";
  int? precio = 0;
  String? categoria = "";
  String? descripcion = "";
  DateTime? fechaInicio = DateTime.now();
  DateTime? fechaFinal = DateTime.now();
  String? nombreVendedor = "";
  String? apellidoVendedor = "";
  int? cantidad = 0;

  String url = "";

  Producto({
    required this.nombreProducto,
    required this.precio,
    required this.categoria,
    required this.nombreVendedor,
    required this.apellidoVendedor,
    required this.descripcion,
    required this.url,
  });
  // imagen

  Producto.fromJson(Map<String, dynamic> json) {
    // print(json);
    nombreProducto = json["nombreProducto"];
    precio = json["precio"];
    categoria = json["categoria"];
    descripcion = json["descripcion"];
    fechaInicio = json["fechaInicio"];
    fechaFinal = json["fechaFinal"];
    nombreVendedor = json["nombreVendedor"];
    apellidoVendedor = json["apellidoVendedor"];
    cantidad = json["cantidad"];
    url = json["url"];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nombreProducto'] = nombreProducto;
    _data['precio'] = precio;
    _data['descripcion'] = descripcion;
    _data['categoria'] = categoria;
    _data['fechaFinal'] = fechaFinal;
    _data['nombreVendedor'] = nombreVendedor;
    _data['apellidoVendedor'] = apellidoVendedor;
    _data['cantidad'] = cantidad;
    _data['url'] = url;
    return _data;
  }
}
