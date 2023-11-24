import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_crud_cloudstore/utils/constants.dart';

class Item {
  String name;
  Item({required this.name});

  Map<String, dynamic> toJson() => {
    'name': name,
  };

  static Item fromJson(Map<String,dynamic> json) => Item(
    name: json['name'],
  );
}


Future create({required String name}) {
  CollectionReference items = FirebaseFirestore.instance.collection(Constants.collectionName);
  return items
      .doc()
      .set({
    'name': name,
  });
}

Future delete({required DocumentSnapshot doc}) {
  CollectionReference items = FirebaseFirestore.instance.collection(Constants.collectionName);
  return items
      .doc(doc.id)
      .delete();
}

Future update({required DocumentSnapshot doc, required String newName}) {
  CollectionReference items = FirebaseFirestore.instance.collection(Constants.collectionName);
  return items
      .doc(doc.id)
      .update({'name': newName});
}