import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_example/model/todo_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ActionChip(
                  label: Text("Logout"),
                  onPressed: () { logout(); }),
              ActionChip(
                  label: Text("Get Current User"),
                  onPressed: () { getCurrentUserId(); }),
              ActionChip(
                  label: Text("Get Users"),
                  onPressed: () { getUsers(); }),
              ActionChip(
                  label: Text("Add Data"),
                  onPressed: () { addData(); }),
              ActionChip(
                  label: Text("Read Data"),
                  onPressed: () { readData(); }),
              ActionChip(
                  label: Text("Update Data"),
                  onPressed: () { updateData(); }),
              ActionChip(
                  label: Text("Delete Data"),
                  onPressed: () { deleteData(); }),
            ],
          ),
        ),
      ),
    );
  }


  Future logout() async {
    var result = FirebaseAuth.instance.signOut();
    print(result);
  }

  Future getCurrentUserId() async {
    print(FirebaseAuth.instance.currentUser);
  }

  Future getUsers() async {
    var currentUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("users").doc(currentUser!.uid)
        .get()
        .then((value) {
      print(value.data());
    });
  }

  Future addData() async {
    // CollectionReference users = FirebaseFirestore.instance.collection('myList');
    // users.add({
    //   'full_name': 'test1',
    //   'company': 'test2',
    //   'age': 23
    // }).then((value) => print("User Added")).catchError((error) =>
    //     print("Failed to add user: $error"));


    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;
    TodoModel todoModel = TodoModel();
    todoModel.todo_title = "test1";
    todoModel.todo_desc = "desc1";
    firebaseFirestore.collection("todo").doc(user?.uid).set(todoModel.toMap());
  }

  Future readData() async {
    // User? user = FirebaseAuth.instance.currentUser;
    // FirebaseFirestore.instance.collection('users').doc(user?.uid).get().then((DocumentSnapshot documentSnapshot) {
    //   if (documentSnapshot.exists) {
    //     print('Document exists on the database');
    //   }
    // });


    // User? user = FirebaseAuth.instance.currentUser;
    // FirebaseFirestore.instance.collection('users').doc(user?.uid).get().then((DocumentSnapshot documentSnapshot) {
    //   if (documentSnapshot.exists) {
    //     print('Document data: ${documentSnapshot.data()}');
    //   } else {
    //     print('Document does not exist on the database');
    //   }
    // });


    // FirebaseFirestore.instance.collection('users').where('age', isGreaterThan: 20).get().then((QuerySnapshot querySnapshot) {
    //   querySnapshot.docs.forEach((doc) {
    //     print(doc["email"]);
    //   });
    // });


    // FirebaseFirestore.instance.collection('users').where('language', arrayContainsAny: ['en', 'it']).get().then((QuerySnapshot querySnapshot) {
    //   querySnapshot.docs.forEach((doc) {
    //     print(doc["email"]);
    //   });
    // });


    // Read More Qurires
    // https://firebase.flutter.dev/docs/firestore/usage/


    FirebaseFirestore.instance.collection('users').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["email"]);
      });
    });
  }

  Future updateData() async {
      User? user = FirebaseAuth.instance.currentUser;
      CollectionReference users = FirebaseFirestore.instance.collection('users');
      return users.doc(user?.uid).update({'firstName': 'testUpdateName'})
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
  }

  Future deleteData() async {
    CollectionReference users = FirebaseFirestore.instance.collection('myList');
    users.doc('pQEnMxsrOS4iroN8MgdC').delete().then((value) => print("User Deleted")).catchError((error) => print("Failed to delete user: $error"));
  }

}