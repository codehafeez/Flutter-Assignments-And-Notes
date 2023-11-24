import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_cloudstore/models/items_model.dart';
import 'package:flutter_crud_cloudstore/utils/constants.dart';

class Firebase_CRUD extends StatefulWidget {
  @override
  State<Firebase_CRUD> createState() => _Firebase_CRUDState();
}

class _Firebase_CRUDState extends State<Firebase_CRUD> {
  late TextEditingController controller;
  late TextEditingController controller2;

  final Stream<QuerySnapshot> _itemsStream = FirebaseFirestore.instance
      .collection(Constants.collectionName)
      .snapshots(includeMetadataChanges: true);


  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller2 = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CloudStore'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 180,
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Create item',
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  final name = controller.text;
                  create(name: name);
                  controller.clear();
                },
                child: const Text("Create"),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _itemsStream,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                return ListView(
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                    return ListTile(
                      title: Text(data['name']),
                      leading: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Center(child: Text('Update')),
                                content: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: TextField(
                                        controller: controller2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                actions: <Widget>[
                                  FloatingActionButton(
                                      child: Text('Cancel', style: TextStyle(color: Colors.red),),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }),
                                  FloatingActionButton(
                                      child: Text('Ok'),
                                      onPressed: () {
                                        final newName = controller2.text;
                                        update(doc: document, newName: newName);
                                        controller2.clear();
                                        Navigator.of(context).pop();
                                      })
                                ],
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        child: const Text("Update"),
                      ),
                      trailing: Wrap(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            onPressed: () {
                              delete(doc: document);
                            },
                            child: const Text("Delete"),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}