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

  List myList = [];

  @override
  initState(){
    print('read users');
    readDataFunction();
  }

  Future readDataFunction() async {
    String url = baseUrl+"read_users.php";
    var response = await http.post(Uri.parse(url));
    var returnData = jsonDecode(response.body);
    print(returnData);
    setState(() {
      myList = returnData;
    });
    // for(int i=0; i<myList.length; i++){
    //   print(myList[i]['id']+' = '+myList[i]['name']+' = '+myList[i]['email']+' = '+myList[i]['phone']+'\n');
    // }
  }

  Future viewDataFunction(user) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => EditUser(user:[user])));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Read Data - PHP MySQL")),

        // body:Column(
        //   children: myList.map((users){
        //     return Container(
        //       child: ListTile(
        //         title: Text(users['name']),
        //         subtitle: Text("Email: " + users['email']),
        //       ),
        //       margin: EdgeInsets.all(5),
        //       padding: EdgeInsets.all(5),
        //       color: Colors.green[100],
        //     );
        //   }).toList(),
        // ),

        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Container(
              child: Column(
                children: [
                  ElevatedButton(
                    child: Text('Add New Data'),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddUser()));
                    },
                  ),
                  Column(
                    children: myList.map((users){
                      return Container(
                        child: Card(
                          child:ListTile(
                            title: Text('Name : '+users['name']),
                            subtitle: Text('Email : '+users['email']),
                            trailing: ElevatedButton(
                              child: Icon(Icons.remove_red_eye),
                              onPressed: (){
                                viewDataFunction(users);
                              },
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        )


    );
  }
}
