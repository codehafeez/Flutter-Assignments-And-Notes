import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  return runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  Future addFunction() async {
    String url = "http://192.168.100.74/flutter-api/add.php";
    var data = {
      'name': 'hafeez',
      'phone': '123123',
      'email': 'test@mail.com',
      'age': 25,
    };

    var response = await http.post(url, body: json.encode(data));
    var returnData = jsonDecode(response.body);
    print(returnData['message']);
  }

  Future readFunction() async {
    String url = "http://192.168.100.74/flutter-api/read.php";
    var response = await http.post(url);
    var returnData = jsonDecode(response.body);
    print(returnData);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('PHP MySQL Operations - CRUD'),
                SizedBox(height:20),
                FlatButton(
                  child: Text('Add'),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: () { addFunction(); },
                ),
                FlatButton(
                  child: Text('Read'),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: () { readFunction(); },
                ),
              ],
            )),
      ),
    );
  }
}
