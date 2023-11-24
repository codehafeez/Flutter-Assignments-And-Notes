import 'package:flutter/material.dart';
import 'dart:math';

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
            title: Text('Click Images Example'),
            backgroundColor: Colors.blueGrey,
          ),

          body: SafeArea(
            child: Center(

              child: Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      padding: const EdgeInsets.all(20),
                      onPressed: () {
                        var currentNum = Random().nextInt(6) + 1; // 1 to 6
                        print('Random Number (1 to 6) : $currentNum');
                      },
                      child: Image.asset('images/dice1.png'),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      padding: const EdgeInsets.all(20),
                      onPressed: () {
                        print('test msg2');
                      },
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
