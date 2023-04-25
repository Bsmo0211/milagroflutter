import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:milagro/items/drawer.dart';
import 'package:milagro/models/productos.dart';
import 'package:milagro/models/usuarios.dart';
import 'package:milagro/widgets/carrito_compras.dart';
import 'package:milagro/widgets/informacion_producto_detallada.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CarritoCompras()),
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
              size: 25,
            ),
          ),
        ],
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
              Producto producto = list.productos[index];

              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InformacionProductoDetallada(
                                  producto: producto,
                                  usuario: usuario!,
                                )),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                      elevation: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 15,
                                bottom: 10,
                              ),
                              child: Image.network(
                                producto.url,
                                cacheHeight: 100,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return const CircularProgressIndicator();
                                },
                              ),
                            ),
                          ),
                          const Divider(
                            height: 1,
                            color: Colors.grey,
                          ),
                          ListTile(
                            contentPadding:
                                const EdgeInsets.fromLTRB(15, 0, 25, 0),
                            title: Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Nombre Producto: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${producto.nombreProducto}',
                                    style: const TextStyle(
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
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
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
                                  TextSpan(
                                    text: '${producto.precio} x kg',
                                    style: const TextStyle(
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
                                        Icons.person,
                                        size: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const TextSpan(
                                    text: 'Nombre vendedor: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '${producto.nombreVendedor} ${producto.apellidoVendedor}',
                                    style: const TextStyle(
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
                                        size: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const TextSpan(
                                    text: 'Cantidad disponible: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${producto.cantidad} Libras ',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
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
