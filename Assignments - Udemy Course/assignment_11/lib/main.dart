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

                  SizedBox(height:10),

                  SizedBox(
                    height:10,
                    width: 150,
                    child: Divider(
                      color: Colors.teal.shade100,
                      height: 20,
                    ),
                  ),

                  Card(
                    margin: EdgeInsets.symmetric(horizontal:50, vertical:20),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      title: Text(
                        '+92 3123349398',
                        style: TextStyle(
                          color: Colors.teal,
                          fontSize: 20
                        ),
                      ),
                    ),
                  ),

                  Card(
                    margin: EdgeInsets.symmetric(horizontal:50, vertical:0),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.teal,
                      ),
                      title: Text(
                        'codehafeez@gmail.com',
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 20
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          )
      );
  }
}
