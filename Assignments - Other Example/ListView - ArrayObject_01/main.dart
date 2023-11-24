import 'package:flutter/material.dart';
void main() {
  runApp(
      MaterialApp(home: MyApp())
  );
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<User> users = [
    User(name: "Hari Prasad Chaudhary", address: "Kathmandu, Nepal"),
    User(name:"David Mars", address: "Bangalore, India"),
    User(name:"Aurn Thapa", address:"Canada"),
    User(name: "John Bal", address:"United States of America")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text("List View - Array Object")),
        body: Column(
          children: users.map((userone){
            return Container(
              child: ListTile(
                title: Text(userone.name),
                subtitle: Text("Address: " + userone.address),
              ),
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              color: Colors.green[100],
            );
          }).toList(),
        )
    );
  }
}

class User {
  String name, address;
  User({required this.name, required this.address});
}
