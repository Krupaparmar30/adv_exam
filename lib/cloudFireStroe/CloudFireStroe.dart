import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFireBaseStoreServices {
  CloudFireBaseStoreServices._();

  static CloudFireBaseStoreServices cloudFireBaseStoreServices =
      CloudFireBaseStoreServices._();

  CollectionReference firebaseFirestore =
      FirebaseFirestore.instance.collection('books');

  void addUser(String title, String author, String status) {
    firebaseFirestore
        .add({'title': title, 'author': author, 'status': status});

  }

  void delectUser(String dcId) {
    firebaseFirestore
        .doc(dcId)
        .delete();
  }
}
