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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('images/profile.png'),
                    )
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    child: Text(
                      "Abdul Hafeez",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight:FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width:10,
                        ),
                        Text(
                          '+92 3123349398',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
      );
  }
}
