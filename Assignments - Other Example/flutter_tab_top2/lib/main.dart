import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBarPage(),
    );
  }
}

class TabBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Todo"),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: new Icon(Icons.task),
                  text: "All Tasks",
                ),
                Tab(
                  icon: new Icon(Icons.list_rounded),
                  text: "Complete Tasks",
                ),
                Tab(
                  icon: new Icon(Icons.incomplete_circle),
                  text: "InComplete Tasks",
                ),
                // Tab(text: "All Tasks"),
                // Tab(text: "Complete Tasks"),
                // Tab(text: "InComplete Tasks")
              ],
              isScrollable: true,
            ),
          ),
          body: TabBarView(children: [AllTasks(), CompleteTasks(), InCompleteTasks()])),
    );
  }
}

class AllTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("All Tasks"),
    );
  }
}

class CompleteTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Complete Tasks"),
    );
  }
}

class InCompleteTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("InComplete Tasks"),
    );
  }
}
