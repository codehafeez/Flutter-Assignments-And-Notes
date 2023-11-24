import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'messages.dart';
import 'more.dart';
import 'news.dart';
import 'profile.dart';
class Home extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home>{

  int selectedIndex = 0;
  List<Widget> listWidgets = [
    News(),
    Profile(),
    Messages(),
    More()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listWidgets[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.rss_feed), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.more), label: 'More'),
        ],
        unselectedItemColor: Colors.black38,
        selectedItemColor: Colors.black,
        unselectedLabelStyle: TextStyle(color: Colors.black),
        selectedLabelStyle: TextStyle(color: Colors.black38),
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index){
    setState(() { selectedIndex = index; });
  }
}