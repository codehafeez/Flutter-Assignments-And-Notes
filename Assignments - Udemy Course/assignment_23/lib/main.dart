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
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Icon(
                          Icons.male, size: 80,
                          color: Colors.white,
                        ),
                        Text(
                          "Male",
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
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    height: 200,
                    width: 170,
                  ),
                ),
              ],
            ),
          ),

          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      SizedBox(height:40),
                      Icon(
                        Icons.add, size: 80,
                        color: Colors.white,
                      ),
                      Text(
                        "Add Button",
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
          ),

          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  height: 200,
                  width: 170,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  height: 200,
                  width: 170,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

