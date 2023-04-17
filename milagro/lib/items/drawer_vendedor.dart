import 'package:flutter/material.dart';
import 'package:milagro/common/config.dart';
import 'package:milagro/models/usuarios.dart';
import 'package:milagro/services/auth_Services.dart';

class DrawerVendedor extends StatelessWidget {
  UsuarioProvider? usuario;
  DrawerVendedor({
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
              height: 185,
              width: 500,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Config.green,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 60, 10, 5),
                      child: Text(
                        '${usuario?.usuario!.primerNombre} ${usuario?.usuario!.primerApellido}',
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
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.add,
                      size: 20,
                      color: Colors.black,
                    ),
                    title: const Text(
                      'Agregar Producto',
                      textAlign: TextAlign.left,
                      style: TextStyle(
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
    ;
  }
}
