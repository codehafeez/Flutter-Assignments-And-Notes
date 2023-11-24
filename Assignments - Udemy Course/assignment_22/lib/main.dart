import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Basic Alert Demo'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: RaisedButton(
        child: Text('Show alert'),
        onPressed: () {
          showAlertDialog(context);
        },
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Simple Alert"),
        content: Text("This is an alert message."),
        actions: [
          FlatButton(
            child: Text("OK"),
            onPressed: () {
              print("okay press");
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text("Cancel"),
            onPressed: () {
              print("Cancel press");
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}