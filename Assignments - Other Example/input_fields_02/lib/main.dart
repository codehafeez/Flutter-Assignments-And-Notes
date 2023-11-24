import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void initState() {
    username.text = ""; //innitail value of text field
    password.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Icons on TextField"),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                  controller: username,
                  decoration: InputDecoration(
                    labelText: "Username",
                    icon: Icon(Icons.people), //icon at head of input
                  )
              ),

              TextField(
                  controller: password,
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock), //icon at head of input
                      //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too.
                      labelText: "Password",
                      suffixIcon: Icon(Icons.remove_red_eye) //icon at tail of input
                  )
              ),

            ],
          ),
        )
    );
  }
}