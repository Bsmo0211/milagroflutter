import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:milagro/items/drawer.dart';
import 'package:milagro/models/productos.dart';
import 'package:milagro/models/usuarios.dart';
import 'package:provider/provider.dart';

class Compras extends StatefulWidget {
  const Compras({super.key});

  @override
  State<Compras> createState() => _ComprasState();
}

class _ComprasState extends State<Compras> {
  User? usuario = FirebaseAuth.instance.currentUser;
  List<Producto> productos = [];

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<ProductoProvider>(context);
    final user = Provider.of<UsuarioProvider>(context);

    return Scaffold(
      drawer: DrawerComprador(usuario: user),
      appBar: AppBar(
        title: const Text('Comprador'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Bienvenido a ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: 'MILAGRO!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
            child: Text(
              'Pulsa el Producto que quieres comprar.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: list.productos.length,
            itemBuilder: ((BuildContext context, index) {
              final uno = list.productos[index];

              return Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                      elevation: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding:
                                const EdgeInsets.fromLTRB(15, 10, 25, 0),
                            title: Text(
                              'Nombre Producto ${uno.nombreProducto} ',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Container(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      child: const Icon(
                                        Icons.attach_money,
                                        size: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const TextSpan(
                                    text: 'Precio: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: 'Numero x kg',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Container(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      child: const Icon(
                                        Icons.attach_money,
                                        size: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const TextSpan(
                                    text: 'Destinación Económica: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: 'Sin información',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(15, 15, 0, 10),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Container(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      child: const Icon(
                                        Icons.abc,
                                        size: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const TextSpan(
                                    text: 'Nombre: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          )),
        ],
      ),
    );
  }
}
