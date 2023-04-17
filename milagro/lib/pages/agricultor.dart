import 'package:flutter/material.dart';
import 'package:milagro/items/drawer.dart';
import 'package:milagro/items/drawer_vendedor.dart';
import 'package:milagro/models/usuarios.dart';
import 'package:provider/provider.dart';

class Vendedor extends StatefulWidget {
  const Vendedor({super.key});

  @override
  State<Vendedor> createState() => _VendedorState();
}

class _VendedorState extends State<Vendedor> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UsuarioProvider>(context);
    return Scaffold(
      drawer: DrawerVendedor(usuario: user),
      appBar: AppBar(
        title: Text('Bienvenido Vendedor! :)'),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 15,
              ),
              child: Text(
                'Tus ordenes',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
