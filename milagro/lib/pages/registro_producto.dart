import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:milagro/common/config.dart';
import 'package:milagro/common/constants.dart';
import 'package:milagro/db/index.dart';
import 'package:milagro/firebase/querys.dart';
import 'package:milagro/models/usuarios.dart';
import 'package:milagro/services/upload_image.dart';
import 'package:provider/provider.dart';

class RegistroProducto extends StatefulWidget {
  RegistroProducto({
    super.key,
  });

  @override
  State<RegistroProducto> createState() => _RegistroProductoState();
}

class _RegistroProductoState extends State<RegistroProducto> {
  final formKey1 = GlobalKey<FormState>();

  List<String> dropdownCategorias = [
    Constants.frutas,
    Constants.verduras,
    Constants.tuberculos,
    Constants.otros,
  ];
  String? _itemSeleccionadoProducto;

  TextEditingController nombreProductoCtrl = TextEditingController();
  TextEditingController precioCtrl = TextEditingController();
  TextEditingController categoriaCtrl = TextEditingController();
  TextEditingController descripcionCtrl = TextEditingController();
  TextEditingController nombrevendedorCtrl = TextEditingController();
  TextEditingController apellidoVendedorCtrl = TextEditingController();
  TextEditingController cantidadCtrl = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  File? fotoProducto;
  tomarFoto() async {
    XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      File photofile = File(photo.path);
      setState(() {
        fotoProducto = photofile;
      });
    }
  }

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
    UsuarioProvider user = Provider.of<UsuarioProvider>(context);
    int precio = 0;
    int cantidad = 0;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  'vendedor',
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
                'Registro Producto',
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
                                labelText: 'Nombre producto',
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3,
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.flatware_outlined,
                                  size: 25,
                                ),
                              ),
                              controller: nombreProductoCtrl,
                              validator: (nombreProductoCtrl) {
                                if (nombreProductoCtrl == null ||
                                    nombreProductoCtrl.isEmpty) {
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
                                labelText: 'Precio',
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3,
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.price_check_rounded,
                                  size: 25,
                                ),
                              ),
                              controller: precioCtrl,
                              validator: (precioCtrl) {
                                if (precioCtrl == null || precioCtrl.isEmpty) {
                                  return 'El campo es obligatorio';
                                } else {
                                  setState(() {
                                    precio = int.parse(precioCtrl);
                                  });
                                }
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
                                labelText: 'Descripción',
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3,
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.text_fields_outlined,
                                  size: 25,
                                ),
                              ),
                              controller: descripcionCtrl,
                              validator: (descripcionCtrl) {
                                if (descripcionCtrl == null ||
                                    descripcionCtrl.isEmpty) {
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
                                labelText: 'Cantidad por libra',
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 3,
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.all_inbox_rounded,
                                  size: 25,
                                ),
                              ),
                              controller: cantidadCtrl,
                              validator: (cantidadCtrl) {
                                if (cantidadCtrl == null ||
                                    cantidadCtrl.isEmpty) {
                                  return 'El campo es obligatorio';
                                } else {
                                  setState(() {
                                    cantidad = int.parse(cantidadCtrl);
                                  });
                                }
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
                                    Icons.category,
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
                                value: _itemSeleccionadoProducto,
                                hint: const Text("Categoria"),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: dropdownCategorias.map((String items) {
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
                                      _itemSeleccionadoProducto = newValue!;
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          fotoProducto != null
                              ? Image.file(fotoProducto!)
                              : Column(
                                  children: [
                                    const Text(
                                      'La imagen no ha sido cargada',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: ElevatedButton.icon(
                                        label: const Text(
                                          'Subir Foto Producto ',
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
                                          backgroundColor:
                                              MaterialStatePropertyAll<Color>(
                                            Config.green,
                                          ),
                                        ),
                                        onPressed: () async {
                                          tomarFoto();
                                        },
                                      ),
                                    ),
                                  ],
                                )
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
                'Crear Producto ',
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
                if (fotoProducto != null) {
                  final resultado =
                      await SubidaImagen().subidaImagen(fotoProducto!);
                  if (resultado['success'] == true) {
                    String url = resultado['url'];

                    if (validate()) {
                      FireBaseQuery().addProducto(
                        nombreProductoCtrl.text,
                        precio,
                        _itemSeleccionadoProducto ?? '',
                        descripcionCtrl.text,
                        user.usuario!.primerNombre,
                        user.usuario!.primerApellido,
                        cantidad,
                        url,
                      );

                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        'vendedor',
                        (route) => false,
                      );
                    }
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
