import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home:Scaffold(
        body: Center(
          child: Text(
            "Hello World - Add Font Example",
            style: TextStyle(
              fontFamily: 'Schyler',
              fontStyle: FontStyle.italic,
              fontSize: 22,
              color: Colors.teal,
              fontWeight: FontWeight.bold,
            ),
          )
        ),
      ),
    ),
  );
}