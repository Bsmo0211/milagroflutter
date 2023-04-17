import 'package:flutter/material.dart';
import 'package:milagro/common/config.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PantallaCarga extends StatelessWidget {
  const PantallaCarga({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'La aplicación Milagro',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 15,
            ),
          ),
          SpinKitDoubleBounce(
            size: 50,
            color: Colors.white,
          ),
          Text(
            'Cargando...',
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
