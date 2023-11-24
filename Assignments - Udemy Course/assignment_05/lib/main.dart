import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: FlatButton(
            child: Text('Click to Play Sound',
              style: TextStyle(fontSize: 20)
            ),
            color: Colors.blueAccent,
            textColor: Colors.white,
            onPressed: () {
              playSoundFunction();
            },
          ),
        ),
      ),
    ),
  );
}

void playSoundFunction(){
  final player = AudioCache();
  player.play("sounds/note1.wav");
}
