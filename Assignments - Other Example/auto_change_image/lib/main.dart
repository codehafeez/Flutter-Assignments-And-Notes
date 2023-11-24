import 'dart:async';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String imageUrl = 'logo1';

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      if(imageUrl == 'logo1'){ imageUrl = 'logo2'; }
      else { imageUrl = 'logo1'; }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title:Text("Auto Change Image Using Timer")),
            body: Container(
                child: Center(
                  child:Image.asset('assets/images/$imageUrl.png'),
                ),
            )
        )
    );
  }
}