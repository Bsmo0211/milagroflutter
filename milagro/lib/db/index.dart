import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:milagro/models/ordenTemp.dart';
import 'package:milagro/models/productos.dart';
import 'package:milagro/models/usuarios.dart';

class DB {
  late FirebaseFirestore db;
  static String collectionProductos = 'productos';
  static String collectionUsuario = 'usuarios';
  static String collectionOrdenes = 'ordenes';
  static String collectionOrdenesTemp = 'ordenesTemp';
  DB() {
    db = FirebaseFirestore.instance;
  }
  Future<List<Producto>> getProductos() async {
    List<Producto> list = [];

    final model = (db.collection(collectionProductos).withConverter<Producto>(
        fromFirestore: (snapshot, _) => Producto.fromJson(snapshot.data()!),
        toFirestore: (Producto, _) => Producto.toJson()));

    final fet = (await model.get());

    for (QueryDocumentSnapshot<Producto> doc in fet.docs) {
      list.add(doc.data());
    }
    return list;
  }

  Future<Usuario> getUsuario() async {
    Usuario usuario;

    final model = (db
        .collection(collectionUsuario)
        .where('correo', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .withConverter<Usuario>(
            fromFirestore: (snapshot, _) => Usuario.fromJson(snapshot.data()!),
            toFirestore: (Usuario, _) => Usuario.toJson()));

    final fet = (await model.get());

    if (fet.docs.isEmpty) {
      throw Exception('No se encontró el usuario con ese correo electrónico');
    }

    usuario = fet.docs.first.data();
    return usuario;
  }

  Future<List<OrdenTemp>> getOrdenTemp() async {
    List<OrdenTemp> list = [];

    final model = (db
        .collection(collectionOrdenesTemp)
        .where(
          'uidUsuario',
          isEqualTo: FirebaseAuth.instance.currentUser!.uid,
        )
        .withConverter<OrdenTemp>(
            fromFirestore: (snapshot, _) =>
                OrdenTemp.fromJson(snapshot.data()!),
            toFirestore: (OrdenTemp, _) => OrdenTemp.toJson()));

    final fet = (await model.get());

    for (QueryDocumentSnapshot<OrdenTemp> doc in fet.docs) {
      list.add(doc.data());
    }
    return list;
  }
}
