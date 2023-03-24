import 'package:flutter/material.dart';
import 'package:milagro/common/config.dart';
import 'package:milagro/services/auth_Services.dart';

class DrawerPropio extends StatelessWidget {
  const DrawerPropio({super.key});

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
                  children: const [],
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
