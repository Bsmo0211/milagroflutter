import 'package:flutter/material.dart';
import 'package:milagro/common/config.dart';
import 'package:milagro/items/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerPropio(),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text(
              'Escoja a quien le gustaria hacerle la compra.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Center(
            child: ElevatedButton.icon(
              label: const Text(
                'Agricultor',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              icon: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                  Config.green,
                ),
              ),
              onPressed: () {
                print('object');
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15),
          ),
          Center(
            child: ElevatedButton.icon(
              label: const Text(
                'Centro Acopio',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              icon: const Icon(
                Icons.store,
                color: Colors.black,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                  Config.green,
                ),
              ),
              onPressed: () {
                print('object');
              },
            ),
          )
        ],
      ),
    );
  }
}
