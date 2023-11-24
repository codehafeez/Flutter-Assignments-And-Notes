import 'package:flutter/material.dart';
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
      floatingActionButton:FloatingActionButton( //Floating action button on Scaffold
        onPressed: (){
          //code to execute on button press
        },
        child: Icon(Icons.send), //icon inside button
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      //floating action button position to right

      bottomNavigationBar: BottomAppBar( //bottom navigation bar on scaffold
        color:Colors.redAccent,
        shape: CircularNotchedRectangle(), //shape of notch
        notchMargin: 5, //notche margin between floating button and bottom appbar
        child: Row( //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.menu, color: Colors.white,), onPressed: () {},),
            IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: () {},),
            IconButton(icon: Icon(Icons.print, color: Colors.white,), onPressed: () {},),
            Padding(
              padding: EdgeInsets.only(right:90),
              child:IconButton(icon: Icon(Icons.people, color: Colors.white,), onPressed: () {},),
            )
          ],
        ),
      ),
    );

    // return  Scaffold(
    //   floatingActionButton:FloatingActionButton( //Floating action button on Scaffold
    //     onPressed: (){
    //       //code to execute on button press
    //     },
    //     child: Icon(Icons.send), //icon inside button
    //   ),
    //
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    //   //floating action button position to center
    //
    //   bottomNavigationBar: BottomAppBar( //bottom navigation bar on scaffold
    //     color:Colors.redAccent,
    //     shape: CircularNotchedRectangle(), //shape of notch
    //     notchMargin: 5, //notche margin between floating button and bottom appbar
    //     child: Row( //children inside bottom appbar
    //       mainAxisSize: MainAxisSize.max,
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: <Widget>[
    //         IconButton(icon: Icon(Icons.menu, color: Colors.white,), onPressed: () {},),
    //         IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: () {},),
    //         IconButton(icon: Icon(Icons.print, color: Colors.white,), onPressed: () {},),
    //         IconButton(icon: Icon(Icons.people, color: Colors.white,), onPressed: () {},),
    //       ],
    //     ),
    //   ),
    // );

    // return  Scaffold(
    //   floatingActionButton:FloatingActionButton( //Floating action button on Scaffold
    //     onPressed: (){
    //       //code to execute on button press
    //     },
    //     child: Icon(Icons.send), //icon inside button
    //   ),
    //
    //   floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    //   //floating action button location to left
    //
    //   bottomNavigationBar: BottomAppBar( //bottom navigation bar on scaffold
    //     color:Colors.redAccent,
    //     shape: CircularNotchedRectangle(), //shape of notch
    //     notchMargin: 5, //notche margin between floating button and bottom appbar
    //     child: Row( //children inside bottom appbar
    //       mainAxisSize: MainAxisSize.max,
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: <Widget>[
    //         Padding(
    //           padding: EdgeInsets.only(left:90),
    //           child:IconButton(icon: Icon(Icons.menu, color: Colors.white,), onPressed: () {},),
    //         ),
    //         IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: () {},),
    //         IconButton(icon: Icon(Icons.print, color: Colors.white,), onPressed: () {},),
    //         IconButton(icon: Icon(Icons.people, color: Colors.white,), onPressed: () {},),
    //       ],
    //     ),
    //   ),
    // );
  }
}