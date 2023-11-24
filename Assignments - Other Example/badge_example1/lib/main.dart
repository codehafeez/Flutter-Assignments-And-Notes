import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Badge Example")),
      appBar: new AppBar(
        title: new Text("Badge Example"),
        centerTitle: true,
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 3, end: 18),
            animationDuration: Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeContent: Text('$_counter', style: TextStyle(color: Colors.white)),
            child: IconButton(
                icon: Icon(Icons.shopping_cart),
                padding: EdgeInsets.only(right: 30.0),
                onPressed: () {

                }),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Badge(
              child: Icon(Icons.shopping_cart),
              badgeContent: Text('$_counter'),
            ),
            SizedBox(height:50),
            Badge(
              position: BadgePosition.bottomEnd(),
              child: Icon(Icons.shopping_cart),
              badgeContent: Text('$_counter'),
            ),
            SizedBox(height:50),
            Badge(
              child: Card(
                  child: Padding(
                    padding:EdgeInsets.all(10),
                    child: Icon(Icons.shopping_cart),
                  )
              ),
              badgeContent: Text('$_counter'),
            ),
            SizedBox(height:50),
            Badge(
              child: Icon(Icons.shopping_cart, size: 40, color: Colors.green,), //icon style
              badgeContent: SizedBox(
                  width: 20, height: 20, //badge size
                  child:Center(  //aligh badge content to center
                    child:Text('$_counter', style: TextStyle(
                        color: Colors.white,  //badge font color
                        fontSize: 20 //badge font size
                    )
                    ),
                  )
              ),
              badgeColor: Colors.purple, //badge background color
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
