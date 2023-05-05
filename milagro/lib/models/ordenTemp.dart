import 'package:flutter/material.dart';
import 'package:milagro/db/index.dart';

class OrdenTempProvider extends ChangeNotifier {
  OrdenTempProvider() {
    cargarOrdenesTemp();
  }
  List<OrdenTemp> ordenTemp = [];
  cargarOrdenesTemp() async {
    ordenTemp = await DB().getOrdenTemp();

    notifyListeners();
  }
}

class OrdenTemp {
  DateTime? fecha;
  List<ProductoOrdenTemp> productos = [];
  String uidUsuario = '';

  OrdenTemp.fromJson(Map<String, dynamic> json) {
    if (json["fecha"].runtimeType == String) {
      fecha = DateTime.parse(json["fecha"]);
    }
    List<Object?> productosMap = json["productos"];

    for (Object? productoTemp in productosMap) {
      productoTemp as Map<String, dynamic>;
      productos.add(ProductoOrdenTemp.fromJson(productoTemp));
    }

    uidUsuario = json['uidUsuario'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    List<Map<String, dynamic>> productosJson = [];
    for (ProductoOrdenTemp producto in productos) {
      productosJson.add(producto.toJson());
    }
    _data['productos'] = productosJson;
    _data['fecha'] = fecha;
    _data['uidUsuario'] = uidUsuario;

    return _data;
  }
}

class ProductoOrdenTemp {
  String? imagen;
  String? nombreProducto;
  int? cantidadProducto;
  int? precio;

  ProductoOrdenTemp({
    required this.imagen,
    required this.nombreProducto,
    required this.cantidadProducto,
    required this.precio,
  });

  ProductoOrdenTemp.fromJson(Map<String, dynamic> json) {
    imagen = json["imagen"];
    nombreProducto = json["nombreProducto"];
    cantidadProducto = json["cantidadProducto"];
    precio = json["precio"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nombreProducto'] = nombreProducto;
    _data['imagen'] = imagen;
    _data['cantidadProducto'] = cantidadProducto;
    _data['precio'] = precio;

    return _data;
  }
}
