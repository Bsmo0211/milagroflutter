import 'package:flutter/material.dart';
import 'package:milagro/models/ordenTemp.dart';
import 'package:milagro/models/usuarios.dart';
import 'package:provider/provider.dart';

class FinalizacionCompra extends StatefulWidget {
  const FinalizacionCompra({super.key});

  @override
  State<FinalizacionCompra> createState() => _FinalizacionCompraState();
}

class _FinalizacionCompraState extends State<FinalizacionCompra> {
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
