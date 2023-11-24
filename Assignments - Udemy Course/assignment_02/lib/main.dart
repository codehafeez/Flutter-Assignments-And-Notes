import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,

        appBar: AppBar(
          title: Text("Show Image by Assets"),
          backgroundColor: Colors.deepPurple,
        ),

        body: Center(
          child: Image(
            image: AssetImage('images/logo1.png'),
          ),
        ),

      ),
    ),
  );
}
