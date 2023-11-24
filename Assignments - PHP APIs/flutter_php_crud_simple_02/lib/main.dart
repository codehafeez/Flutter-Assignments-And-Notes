import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_php_crud_simple/details.dart';
import 'package:flutter_php_crud_simple/env.dart';
import 'package:flutter_php_crud_simple/newdata.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(primarySwatch: Colors.red),
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<List> getData() async {
    final response = await http.get(Uri.parse(baseUrl+'getdata.php'));
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My App Bar")),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext contex)=> NewData()),
        ),
        child: Icon(Icons.add),
      ),
      body:FutureBuilder<List>(
        future: getData(),
        builder: (ctx,user) {
          if(user.hasError){ print("error"); }
          if(user.hasData){
            return Items(list:user.data??[]);
          }
          else{ return Center(child: CircularProgressIndicator()); }
        },
      ),
    );
  }
}

class Items extends StatelessWidget {

  List list;
  Items({required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
       itemCount: list==null?0:list.length,
      itemBuilder: (ctx,i){
        return ListTile(
          leading: Icon(Icons.message),
          title: Text(list[i]['name']),
          subtitle: Text(list[i]['mobile']),
          onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>Details(list:list,index:i))),
        );
      }
    );
  }
}

