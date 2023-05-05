import 'package:flutter/material.dart';
import 'package:milagro/items/drawer.dart';
import 'package:milagro/items/drawer_vendedor.dart';
import 'package:milagro/models/orden.dart';
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
    OrdenProvider orden = Provider.of<OrdenProvider>(context);
    UsuarioProvider user = Provider.of<UsuarioProvider>(context);
    return Scaffold(
      drawer: DrawerVendedor(usuario: user),
      appBar: AppBar(
        title: const Text('Bienvenido Vendedor! :)'),
      ),
      body: Column(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 15,
              ),
              child: Text(
                'Ordenes recibidas',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: orden.orden.length,
              itemBuilder: ((context, index) {
                Orden ordenes = orden.orden[index];
                return Card(
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
                          child: Text(
                            'Número de orden ${ordenes.idOrden}',
                          ),
                        ),
                      ),
                      const Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                        ),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Direccion de entrega: ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: ordenes.direccion,
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
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          top: 10,
                        ),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Método de pago: ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: ordenes.metodoPago,
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
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          top: 10,
                        ),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Total a pagar: ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: '${ordenes.total}',
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
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          top: 10,
                          bottom: 15,
                        ),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Nombre de quien compra: ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              TextSpan(
                                text: '${ordenes.nombreCompleto}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
