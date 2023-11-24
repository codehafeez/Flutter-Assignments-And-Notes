import 'package:flutter/material.dart';

void main() {
  runApp(
    HafeezMainApp()
  );
}

class HafeezMainApp extends StatelessWidget {
  const HafeezMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.red,

          body: Center(
            child: Text("Hello World"),
          ),
        ),
      );
  }
}



