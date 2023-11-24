import 'package:flutter/material.dart';

void main() {
  runApp(HafeezHomeApp());
}

class HafeezHomeApp extends StatelessWidget {
  const HafeezHomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,

        appBar: AppBar(
          title: Text('Show Images Example'),
          backgroundColor: Colors.blueGrey,
        ),

        body: SafeArea(
          child: Center(

            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset('images/dice1.png'),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset('images/dice2.png'),
                  ),
                ),
              ],
            ),

          ),
        ),
      )
    );
  }
}

