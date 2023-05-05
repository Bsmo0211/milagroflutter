import 'package:flutter/material.dart';
import 'package:milagro/db/index.dart';
import 'package:milagro/models/ordenTemp.dart';

class OrdenProvider extends ChangeNotifier {
  OrdenProvider() {
    cargarOrdenes();
  }
  List<Orden> orden = [];

  cargarOrdenes() async {
    orden = await DB().getOrdenes();

    notifyListeners();
  }
}

class Orden {
  int total = 0;
  OrdenTemp? productos;
  String direccion = "";
  String metodoPago = "";
  String nombreCompleto = "";
  String idOrden = "";

  Orden.fromJson(Map<String, dynamic> json) {
    total = json["total"];
    direccion = json["direccion"];
    metodoPago = json["metodoPago"];
    nombreCompleto = json["nombreCompleto"];
    idOrden = json["idOrden"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['direccion'] = direccion;
    _data['metodoPago'] = metodoPago;
    _data['nombreCompleto'] = nombreCompleto;
    _data['idOrden'] = idOrden;

    return _data;
  }
}
