import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:milagro/db/index.dart';
import 'package:milagro/firebase/querys.dart';
import 'package:milagro/models/productos.dart';
import 'package:milagro/widgets/carrito_compras.dart';

class InformacionProductoDetallada extends StatefulWidget {
  Producto producto;
  User usuario;
  InformacionProductoDetallada(
      {super.key, required this.producto, required this.usuario});

  @override
  State<InformacionProductoDetallada> createState() =>
      _InformacionProductoDetalladaState();
}

class _InformacionProductoDetalladaState
    extends State<InformacionProductoDetallada> {
  int _counter = 0;

  void _incrementCounter() {
    if (widget.producto.cantidad! > _counter) {
      setState(() {
        _counter++;
      });
    }
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.producto.nombreProducto}',
        ),
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.network(
                widget.producto.url,
                cacheHeight: 250,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
            child: Text.rich(
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
                    text: '${widget.producto.nombreProducto}',
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
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Descripción Producto: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: '${widget.producto.descripcion}',
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
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Precio Producto: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: '${widget.producto.precio} x Kg',
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
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Vendedor del Producto: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text:
                        '${widget.producto.nombreVendedor} ${widget.producto.apellidoVendedor}',
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
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'cantidad del Producto: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: '${widget.producto.cantidad}',
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
          const Center(
            child: Text('Cantidad de producto a comprar'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: _decrementCounter,
                child: const Text('-'),
              ),
              Text(
                '$_counter',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: const Text('+'),
              ),
            ],
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                int precio = widget.producto.precio! * _counter;

                await FireBaseQuery().addOrdenTemp(
                  widget.producto.nombreProducto!,
                  precio,
                  _counter,
                  widget.producto.url,
                  widget.usuario.uid,
                );

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const CarritoCompras(),
                ));
              },
              child: const Text('AGREGAR AL CARRITO'),
            ),
          ),
        ],
      ),
    );
  }
}
