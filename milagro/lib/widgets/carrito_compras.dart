import 'package:flutter/material.dart';
import 'package:milagro/main.dart';
import 'package:milagro/models/ordenTemp.dart';
import 'package:milagro/widgets/finalizacion_compra.dart';
import 'package:provider/provider.dart';

class CarritoCompras extends StatefulWidget {
  const CarritoCompras({super.key});

  @override
  State<CarritoCompras> createState() => _CarritoComprasState();
}

class _CarritoComprasState extends State<CarritoCompras> {
  @override
  Widget build(BuildContext context) {
    OrdenTempProvider list = Provider.of<OrdenTempProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de compras'),
      ),
      body: list.ordenTemp.isEmpty
          ? const Center(
              child: Text('Vamos!, Agrega algo. :('),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.ordenTemp.length,
                    itemBuilder: ((context, index) {
                      return Expanded(
                          child: Column(
                        children: list.ordenTemp.map((ordenTemp) {
                          return Column(
                            children: ordenTemp.productos.map((producto) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin:
                                    const EdgeInsets.fromLTRB(10, 15, 10, 10),
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
                                          producto.imagen!,
                                          cacheHeight: 100,
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
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
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          15, 0, 25, 0),
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
                                              text:
                                                  '${producto.nombreProducto}',
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
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 0, 0, 10),
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            WidgetSpan(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 5, 0),
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
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 0, 0, 10),
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            WidgetSpan(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 5, 0),
                                                child: const Icon(
                                                  Icons.attach_money,
                                                  size: 17,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            const TextSpan(
                                              text: 'Cantidad: ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '${producto.cantidadProducto} x kg',
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
                              );
                            }).toList(),
                          );
                        }).toList(),
                      ));
                    }),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const FinalizacionCompra(),
                      ));
                    },
                    child: const Text('Comprar'))
              ],
            ),
    );
  }
}
