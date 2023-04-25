import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class SubidaImagen {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<Map<String, dynamic>> subidaImagen(File imagen) async {
    String nombreImagen = imagen.path.split('/').last;

    Reference subida =
        storage.ref().child('productosNuevo').child(nombreImagen);

    UploadTask uploadTask = subida.putFile(imagen);

    TaskSnapshot snapshot = await uploadTask.whenComplete(() => true);

    String url = await snapshot.ref.getDownloadURL();

    print(url);

    if (snapshot.state == TaskState.success) {
      return {'success': true, 'url': url};
    } else {
      return {'success': false, 'url': ''};
    }
  }
}
