import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Future<bool> showExitPopup() async {
      return await showDialog( //show confirm dialogue
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Exit App'),
          content: Text('Do you want to exit an App?'),
          actions:[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              //return false when click on "NO"
              child:Text('No'),
            ),

            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(true),
              //return true when click on "Yes"
              child:Text('Yes'),
            ),

          ],
        ),
      )??false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
        onWillPop: showExitPopup, //call function on back button press
        child:Scaffold(
            appBar: AppBar(
              title: Text("Show PopUp Model"),
              backgroundColor: Colors.redAccent,
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                showExitPopup();
              },
              label: const Text('Click to Show PopUp Model'),
              icon: const Icon(Icons.thumb_up),
              backgroundColor: Colors.pink,
            ),
            body: Center(
              child: Text("Show PopUp Model"),
            )
        )
    );
  }
}