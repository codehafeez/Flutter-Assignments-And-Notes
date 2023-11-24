import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.android), text: "Tab 1",),
              Tab(icon: Icon(Icons.phone_iphone), text: "Tab 2"),
            ],
          ),
          title: Text('Tab Example'),
        ),
        body: TabBarView(
          children: [
            Center( child: Text("Page 1")),
            Center( child: Text("Page 2")),
          ],
        ),
      ),
    );
  }
}
