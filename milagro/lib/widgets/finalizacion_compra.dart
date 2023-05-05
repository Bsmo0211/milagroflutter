import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:milagro/common/config.dart';
import 'package:milagro/firebase/querys.dart';
import 'package:milagro/models/ordenTemp.dart';
import 'package:milagro/models/usuarios.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FinalizacionCompra extends StatefulWidget {
  const FinalizacionCompra({super.key});

  @override
  State<FinalizacionCompra> createState() => _FinalizacionCompraState();
}

class _FinalizacionCompraState extends State<FinalizacionCompra> {
  String url = "https://www.pse.com.co/persona";

  redireccion() async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    OrdenTempProvider list = Provider.of<OrdenTempProvider>(context);
    final user = Provider.of<UsuarioProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Estás a punto... :)'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: list.ordenTemp.map((ordenTemp) {
                int total = ordenTemp.productos.fold(
                    0,
                    (previousValue, producto) =>
                        previousValue + producto.precio!.toInt());
                return Center(
                  child: Column(children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Cantidad de productos seleccionados: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                            text: '${ordenTemp.productos.length}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Total: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          TextSpan(
                            text: '$total',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Dirección de envio: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          TextSpan(
                            text: '${user.usuario?.direccion}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: Text(
                        'Selecciona Método de pago!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Config.green,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: ElevatedButton(
                        onPressed: () async {
                          await FireBaseQuery().addOrden(
                              user.usuario!.direccion,
                              'efectivo',
                              total,
                              '${ordenTemp.uidUsuario} ${ordenTemp.productos.length}',
                              '${user.usuario!.primerNombre} ${user.usuario!.primerApellido}');

                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: ((BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Orden Recibida!'),
                                  content: const Text(
                                      'Su orden ya fue enviada al dueño del producto'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          'compras',
                                          (route) => false,
                                        );
                                      },
                                      child: const Text('Ok'),
                                    )
                                  ],
                                );
                              }));

                          await FireBaseQuery()
                              .eliminarOrdenTemp(ordenTemp.uidUsuario);
                        },
                        child: const Text('Efectivo'),
                      ),
                    ),
                    /*  Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: ElevatedButton(
                        onPressed: () async {
                          await FireBaseQuery().addOrden(
                            user.usuario!.direccion,
                            'pse',
                            total,
                            '${user.usuario!.direccion}+ ${ordenTemp.productos.length}',
                          );
                          await redireccion();
                        },
                        child: const Text('PSE'),
                      ),
                    ) */
                  ]),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
