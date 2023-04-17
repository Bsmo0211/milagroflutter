import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:milagro/common/config.dart';
import 'package:milagro/models/productos.dart';
import 'package:milagro/models/usuarios.dart';
import 'package:milagro/pages/Login.dart';
import 'package:milagro/pages/compras.dart';
import 'package:milagro/pages/home_administrador.dart';
import 'package:milagro/pages/registro.dart';
import 'package:milagro/services/auth_Services.dart';
import 'package:provider/provider.dart';

Widget _defaultHome = AuthServices().handleAuth();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductoProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UsuarioProvider(),
        ),
      ],
      child: const MyApp(),
    );
  }
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
          'compras': (_) => const Compras(),
        });
  }
}
