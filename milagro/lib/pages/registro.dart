import 'package:flutter/material.dart';
import 'package:milagro/common/config.dart';
import 'package:milagro/common/constants.dart';
import 'package:milagro/firebase/querys.dart';
import 'package:milagro/services/auth_Services.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  bool _showPassword = true;
  List<String> dropdownRoles = [
    Constants.agricultor,
    Constants.centroAcopio,
    Constants.comprador
  ];
  String? _itemSeleccionadoRoles;
  final formKey1 = GlobalKey<FormState>();

  TextEditingController correoCtrl = TextEditingController();
  TextEditingController primerNombreCtrl = TextEditingController();
  TextEditingController segundoNombreCtrl = TextEditingController();
  TextEditingController primerApellidoCtrl = TextEditingController();
  TextEditingController segundoApellidoCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController direccionCtrl = TextEditingController();

  bool validate() {
    final form = formKey1.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  'login',
                  (route) => false,
                );
              },
            );
          },
        ),
        title: const Text(
          'Registro',
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 15,
              bottom: 10,
            ),
            child: Center(
              child: Text(
                'Registro Usuario',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Form(
                  key: formKey1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.5,
                                    color: Config.green,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5.0,
                                  horizontal: 15.0,
                                ),
                                labelText: 'Correo',
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3,
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.mail,
                                  size: 25,
                                ),
                              ),
                              controller: correoCtrl,
                              validator: (correoCtrl) {
                                if (correoCtrl == null || correoCtrl.isEmpty) {
                                  return 'El campo es obligatorio';
                                } else {}
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.5,
                                    color: Config.green,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5.0,
                                  horizontal: 15.0,
                                ),
                                labelText: 'Primer nombre',
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3,
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.person,
                                  size: 25,
                                ),
                              ),
                              controller: primerNombreCtrl,
                              validator: (primerNombreCtrl) {
                                if (primerNombreCtrl == null ||
                                    primerNombreCtrl.isEmpty) {
                                  return 'El campo es obligatorio';
                                } else {}
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.5,
                                    color: Config.green,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5.0,
                                  horizontal: 15.0,
                                ),
                                labelText: 'Segundo nombre',
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3,
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.person,
                                  size: 25,
                                ),
                              ),
                              controller: segundoNombreCtrl,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.5,
                                    color: Config.green,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5.0,
                                  horizontal: 15.0,
                                ),
                                labelText: 'Primer apellido',
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3,
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.person,
                                  size: 25,
                                ),
                              ),
                              controller: primerApellidoCtrl,
                              validator: (primerApellidoCtrl) {
                                if (primerApellidoCtrl == null ||
                                    primerApellidoCtrl.isEmpty) {
                                  return 'El campo es obligatorio';
                                } else {}
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.5,
                                    color: Config.green,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5.0,
                                  horizontal: 15.0,
                                ),
                                labelText: 'Segundo apellido',
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3,
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.person,
                                  size: 25,
                                ),
                              ),
                              controller: segundoApellidoCtrl,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1.5,
                                    color: Config.green,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5.0,
                                  horizontal: 15.0,
                                ),
                                labelText: 'Dirección',
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3,
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.gps_fixed,
                                  size: 25,
                                ),
                              ),
                              controller: direccionCtrl,
                              validator: (direccionCtrl) {
                                if (direccionCtrl == null ||
                                    direccionCtrl.isEmpty) {
                                  return 'El campo es obligatorio';
                                } else {}
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: SizedBox(
                              height: 63,
                              child: DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  icon: Icon(
                                    Icons.admin_panel_settings,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                value: _itemSeleccionadoRoles,
                                hint: const Text("Rol"),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: dropdownRoles.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                validator: (itemSeleccionado) {
                                  if (itemSeleccionado == null) {
                                    return 'El campo es obligatiorio. *';
                                  }
                                  return null;
                                },
                                onChanged: (String? newValue) {
                                  setState(
                                    () {
                                      _itemSeleccionadoRoles = newValue!;
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                            child: TextFormField(
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
                              validator: (passCtrl) {
                                if (passCtrl == null || passCtrl.isEmpty) {
                                  return 'Digite una contraseña';
                                } else if (passCtrl.isNotEmpty &&
                                    passCtrl.length < 6) {
                                  return 'Digite una contraseña de al menos 6 caracteres';
                                } else {}
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton.icon(
              label: const Text(
                'Crear Cuenta ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              icon: const Icon(
                Icons.upload,
                color: Colors.black,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                  Config.green,
                ),
              ),
              onPressed: () async {
                if (validate()) {
                  AuthServices().createAccount(correoCtrl.text, passCtrl.text);
                  FireBaseQuery().registroUsuarioTabla(
                    correoCtrl.text,
                    primerNombreCtrl.text,
                    segundoNombreCtrl.text,
                    primerApellidoCtrl.text,
                    segundoApellidoCtrl.text,
                    _itemSeleccionadoRoles!,
                    direccionCtrl.text,
                  );
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    'login',
                    (route) => false,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
