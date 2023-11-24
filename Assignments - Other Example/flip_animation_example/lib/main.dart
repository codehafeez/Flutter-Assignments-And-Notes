import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(

          child: Card(
            child: FlipCard(
              direction: FlipDirection.HORIZONTAL,
              speed: 1000,
              onFlipDone: (status) {
                print(status);
              },
              front: Container(
                child: Image.asset('assets/image1.jpg', height: 400, width: 400),
              ),
              back: Container(
                child: Image.asset('assets/image2.jpg', height: 400, width: 400),
              ),
            ),
          ),

        ), //Center
      ),
    );
  }
}

