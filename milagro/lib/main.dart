import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:milagro/common/config.dart';
import 'package:milagro/pages/Login.dart';
import 'package:milagro/pages/home.dart';
import 'package:milagro/pages/registro.dart';
import 'package:milagro/services/auth_Services.dart';

Widget _defaultHome = AuthServices().handleAuth();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData().copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Config.green,
              ),
        ),
        home: _defaultHome,
        routes: {
          '': (_) => const Home(),
          'home': (_) => const Home(),
          'login': (_) => const Login(),
          'registroUsuario': (_) => const Registro(),
        });
  }
}
