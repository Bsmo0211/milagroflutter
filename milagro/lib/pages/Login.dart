import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:milagro/common/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:milagro/services/auth_Services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  bool _showPassword = true;
  TextEditingController usuarioCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Config.green,
        title: const Text(
          '1000AgroCol',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 50,
                ),
                child: Text(
                  '1000AgroCol',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15,
                      ),
                      child: TextFormField(
                        controller: usuarioCtrl,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Config.green,
                            ),
                          ),
                          focusColor: Config.green,
                          hoverColor: Config.green,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 15.0,
                          ),
                          labelText: 'Usuario',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: Config.green,
                            ),
                          ),
                          icon: const Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      obscureText: _showPassword,
                      decoration: InputDecoration(
                        iconColor: Config.green,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.5,
                            color: Config.green,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          icon: Icon(
                            _showPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 15.0,
                        ),
                        labelText: 'Contraseña',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(3),
                          ),
                        ),
                        icon: const Icon(
                          Icons.lock,
                        ),
                      ),
                      controller: passCtrl,
                      // The validator receives the text that the user has entered.
                      validator: (passCtrl) {
                        if (passCtrl == null || passCtrl.isEmpty) {
                          return 'Digite una contraseña';
                        } else {}
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: ElevatedButton.icon(
                        label: const Text(
                          'Iniciar Sesion ',
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
                          AuthServices()
                              .signIn(context, usuarioCtrl.text, passCtrl.text);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: ElevatedButton.icon(
                        label: const Text(
                          'Iniciar Sesion con Google ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        icon: const Icon(
                          Icons.g_mobiledata,
                          color: Colors.black,
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                            Config.green,
                          ),
                        ),
                        onPressed: () {
                          AuthServices().singInWithGoogle();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '¡Registrate!',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 60, 174, 231),
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          Navigator.popAndPushNamed(
                            context,
                            'registroUsuario',
                          );
                        },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
