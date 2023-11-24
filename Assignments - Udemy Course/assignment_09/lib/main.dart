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
                children: [

                  SizedBox(height:20),

                  Container(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('images/profile.png'),
                      )
                  ),

                  SizedBox(height:10),

                  Container(
                    child: Text(
                      "Abdul Hafeez",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight:FontWeight.bold,
                      ),
                    ),
                  ),


                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical:20, horizontal:50),
                    color: Colors.grey,
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 30,
                        ),

                        SizedBox(width:10),

                        Text(
                          '+92 3123349398',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
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
