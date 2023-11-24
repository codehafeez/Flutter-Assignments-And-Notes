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
          backgroundColor: Colors.teal,

          body: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.white,
                  child: Text("Container 1"),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  child: Text("Container 2"),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: Text("Container 3"),
                ),
              ],
            ),
          ),
        )
      );
  }
}

