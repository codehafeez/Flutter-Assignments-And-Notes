import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(HafeezMainHomeApp());
}

class HafeezMainHomeApp extends StatefulWidget {
  @override
  HafeezPageBody createState() => HafeezPageBody();
}

class HafeezPageBody extends State<HafeezMainHomeApp> {

  List<Icon> iconsMyList = [
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
    Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.check,
      color: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
          home: Scaffold(
            backgroundColor: Colors.teal,

            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          "Quiz 1: Test Message Hello World",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: FlatButton(
                        textColor: Colors.white,
                        color: Colors.green,
                        child: Text(
                          "True",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            iconsMyList.add(Icon(Icons.check, color: Colors.green));
                          });
                        },
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: FlatButton(
                        textColor: Colors.white,
                        color: Colors.red,
                        child: Text(
                          "False",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            iconsMyList.add(Icon(Icons.close, color: Colors.red));
                          });
                        },
                      ),
                    ),
                  ),

                  // Row(
                  //     children: [
                  //     Icon(
                  //       Icons.check,
                  //       color: Colors.green,
                  //     ),
                  //     Icon(
                  //       Icons.close,
                  //       color: Colors.red,
                  //     ),
                  //   ]
                  // ),

                  Row(children: iconsMyList)

                ],
              ),
            ),
          )
      );
  }
}
