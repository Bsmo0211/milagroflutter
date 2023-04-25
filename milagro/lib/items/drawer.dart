import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:milagro/common/config.dart';
import 'package:milagro/models/usuarios.dart';
import 'package:milagro/services/auth_Services.dart';

class DrawerComprador extends StatelessWidget {
  UsuarioProvider? usuario;
  DrawerComprador({
    super.key,
    required this.usuario,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: 500,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Config.green,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
                      child: Text(
                        '${usuario?.usuario!.primerNombre} ${usuario?.usuario!.primerApellido}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Text(
                        '${usuario?.usuario!.rol}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      size: 20,
                      color: Colors.red,
                    ),
                    title: const Text(
                      'Cerrar sesión',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      AuthServices().signOut();
                    },
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
