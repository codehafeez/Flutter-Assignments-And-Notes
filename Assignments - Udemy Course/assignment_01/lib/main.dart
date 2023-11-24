import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(

        backgroundColor: Colors.teal,

        appBar: AppBar(
          title: Text('Example1_Hafeez'),
          backgroundColor: Colors.purple,
        ),

        body: Center(
          child: Image(
            image: NetworkImage('https://img.icons8.com/fluency/150/car.png'),
          ),
        ),

      ),
    ),
  );
}
