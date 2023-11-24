import 'package:flutter/material.dart';

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
                Tab(text: "All Tasks"),
                Tab(text: "Complete Tasks"),
                Tab(text: "InComplete Tasks")
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
