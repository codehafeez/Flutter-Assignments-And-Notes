import 'package:flutter/material.dart';
import 'components/my_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UI Design")),
      body: Column(
        children: [
          MyCard(icon: Icons.male, labelTxt: "Icon 01"),
          MyCard(icon: Icons.female, labelTxt: "Icon 02"),
        ],
      ),
    );
  }
}
