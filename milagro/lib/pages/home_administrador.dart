import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:milagro/common/config.dart';
import 'package:milagro/items/drawer.dart';
import 'package:milagro/services/auth_Services.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url =
      "https://console.firebase.google.com/u/0/project/agro-9c83b/analytics/app/android:com.aplicacion.milagro/overview/~2F%3Ft%3D1681491067399&fpn%3D824463735792&swu%3D1&sgu%3D1&sus%3Dupgraded&cs%3Dapp.m.dashboard.overview&g%3D1?hl=es-419";

  redireccion() async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  User? usuario = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* drawer: DrawerPropio(
        usuario: usuario,
      ), */
      appBar: AppBar(
        backgroundColor: Config.green,
        title: const Text(
          '1000AgroCol',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'A continuación podras ver las estadisticas de la app',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 25,
              ),
              child: GestureDetector(
                child: const Text(
                  'Dashboard',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () async {
                  await redireccion();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
