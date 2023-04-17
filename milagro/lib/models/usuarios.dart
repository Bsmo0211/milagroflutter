import 'package:flutter/cupertino.dart';
import 'package:milagro/db/index.dart';

class UsuarioProvider extends ChangeNotifier {
  UsuarioProvider() {
    cargarUsuario();
  }

  Usuario? usuario;
  cargarUsuario() async {
    usuario = await DB().getUsuario();

    notifyListeners();
  }
}

class Usuario {
  String correo = "";
  String primerApellido = "";
  String primerNombre = "";
  String rol = "";
  String segundoApellido = "";
  String segundoNombre = "";
  String direccion = "";

  Usuario.fromJson(Map<String, dynamic> json) {
    correo = json["correo"];
    primerApellido = json["primerApellido"];
    primerNombre = json["primerNombre"];
    rol = json["rol"];
    segundoApellido = json["segundoApellido"];
    segundoNombre = json["segundoNombre"];
    direccion = json["direccion"];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['correo'] = correo;
    _data['primerApellido'] = primerApellido;
    _data['primerNombre'] = primerNombre;
    _data['rol'] = rol;
    _data['segundoApellido'] = segundoApellido;
    _data['segundoNombre'] = segundoNombre;
    _data['direccion'] = direccion;
    return _data;
  }
}
