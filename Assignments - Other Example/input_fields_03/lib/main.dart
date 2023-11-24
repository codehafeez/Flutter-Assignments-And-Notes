import 'package:flutter/material.dart';
void main() {
  runApp(
      MaterialApp(
        home: MyApp(),
      )
  );
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool passenable = true; //boolean value to track password view enable disable.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text("View/Hide Password on TextField"),
          backgroundColor: Colors.purple,
        ),
        body: Container(
            height: 200,
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [

                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Username Here",
                      labelText: "Username"
                  ),
                ),

                TextField(
                  obscureText: passenable, //if passenable == true, show **, else show password character
                  decoration: InputDecoration(
                      hintText: "Enter Password Here",
                      labelText: "Password",
                      suffix: IconButton(onPressed: (){ //add Icon button at end of TextField
                        setState(() { //refresh UI
                          if(passenable){ //if passenable == true, make it false
                            passenable = false;
                          }else{
                            passenable = true; //if passenable == false, make it true
                          }
                        });
                      }, icon: Icon(passenable == true?Icons.remove_red_eye:Icons.password))
                    //eye icon if passenable = true, else, Icon is ***__
                  ),

                ),

              ],
            )
        )
    );
  }
}