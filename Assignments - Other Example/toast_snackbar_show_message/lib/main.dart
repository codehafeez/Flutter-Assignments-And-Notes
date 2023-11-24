import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        appBar: AppBar(
          title: Text("Flutter Snackbar/Toast"),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Column(
                children:[
                  ElevatedButton(
                    onPressed: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Hello This is Snackbar'),
                          )
                      );
                    },
                    child: Text("Show Snackbar"),
                  ),

                  ElevatedButton(
                    onPressed: (){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Hello This is Snackbar'),
                            action: SnackBarAction(
                              onPressed: (){

                              },
                              label: "DISMISS",
                            ),
                          )
                      );
                    },
                    child: Text("Show Snackbar with Action"),
                  ),

                  ElevatedButton(
                    onPressed: (){
                      Fluttertoast.showToast(
                          msg: "This is Toast Message",
                          toastLength: Toast.LENGTH_SHORT, //duration
                          gravity: ToastGravity.BOTTOM, //location
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red, //background color
                          textColor: Colors.white, //text Color
                          fontSize: 16.0 //font size
                      );
                    },
                    child: Text("Show Toast Message"),
                  )
                ]
            )
        )
    );
  }
}