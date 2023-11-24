import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_php_crud_simple/screens/add_user.dart';
import 'package:flutter_php_crud_simple/screens/edit_user.dart';
import 'package:flutter_php_crud_simple/screens/env.dart';
import 'package:http/http.dart' as http;
class ReadUsers extends StatefulWidget {

  @override
  _ReadUsersState createState() => new _ReadUsersState();
}

class _ReadUsersState extends State<ReadUsers> {

  Future<List> readDataFunction() async {
    final response = await http.get(Uri.parse(baseUrl+'read_users.php'));
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Read Data - PHP MySQL")),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext contex)=> AddUser()),
        ),
        child: Icon(Icons.add),
      ),
      body:Container(
        child: FutureBuilder<List>(
          future: readDataFunction(),
          builder: (ctx,user) {
            if(user.hasError){ print("error"); }
            if(user.hasData){ return MyItems(myList:user.data??[]); }
            else{ return Center(child: CircularProgressIndicator()); }
          },
        ),
      ),
    );
  }
}

class MyItems extends StatelessWidget {

  List myList;
  MyItems({required this.myList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: myList == null?0:myList.length,
        itemBuilder: (myData, i ){
          return Container(
            child: ListTile(
              title: Text(myList[i]['name']),
              subtitle: Text("Email: " + myList[i]['email']),
              onTap: ()=> {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditUser(user:[myList[i]])))
              }
            ),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            color: Colors.green[100],
          );
        }
    );
  }
}
