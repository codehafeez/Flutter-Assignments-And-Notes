import 'package:flutter/material.dart';

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

class MyCard extends StatelessWidget {

  MyCard({required this.icon, required this.labelTxt});
  final IconData icon;
  final String labelTxt;

  @override
  Widget build(BuildContext context) {
    return
      Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(height:40),
                  Icon(
                    icon,
                    size: 80,
                  ),
                  Text(
                    labelTxt,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 200,
              width: 170,
            ),
          ),
        ],
      );
  }
}
