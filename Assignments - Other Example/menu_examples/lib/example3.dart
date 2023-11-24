import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final GlobalKey<ScaffoldState> key_navDrawer = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Drawer Demo')),
      body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text('A drawer is an invisible side screen.', style: TextStyle(fontSize: 20.0)),
              ),
              SizedBox(height: 20),
              FlatButton(
                child: Text('Click Me to Show Nav Drawer',style: TextStyle(fontSize: 20)),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: () => key_navDrawer.currentState!.openDrawer(), // <-- Opens drawer
              ),
            ],
          )
      ),
      key: key_navDrawer, // Assign the key to Scaffold.
      drawer: Drawer(
        // endDrawer: Drawer( // show nav drawer right side
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Abdul Hafeez"),
              accountEmail: Text("codehafeez@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text("H",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home), title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings), title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts), title: Text("Contact Us"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}