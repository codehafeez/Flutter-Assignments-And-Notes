import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  int myNumber = 0;

  void changeNumberFunction() {
    setState(() {
      myNumber = Random().nextInt(6) + 1; // 0 to 6
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Random Number Example',
                  style: TextStyle(fontSize: 20),
                ),
                Text('Random Value : $myNumber'),
                FlatButton(
                  child: Text('Click Me',
                    style: TextStyle(fontSize: 20),
                  ),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  onPressed: () { changeNumberFunction(); },
                ),
              ],
            )),
      ),
    );
  }
}
