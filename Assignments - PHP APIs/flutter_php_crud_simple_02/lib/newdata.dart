import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_php_crud_simple/env.dart';
import 'package:flutter_php_crud_simple/main.dart';
import 'package:http/http.dart' as http;
class NewData extends StatefulWidget {
  @override
  _NewDataState createState() => _NewDataState();
}

class _NewDataState extends State<NewData> {

  TextEditingController cname = new TextEditingController();
  TextEditingController cmobile = new TextEditingController();

  void addData(){
    http.post(Uri.parse(baseUrl+'adddata.php'),body: {
      "name": cname.text,
      "mobile": cmobile.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Data")),
      body: ListView(
        children: [
          TextField(
            controller: cname ,
            decoration: InputDecoration(hintText: "Enter Name",labelText: "Enter Name"),
          ),
          TextField(
            controller: cmobile,
            decoration: InputDecoration(hintText: "Enter Mobile",labelText: "Enter Moblile"),
          ),
          MaterialButton(

            child: Text("Add Data"),
            color:  Colors.red,
            onPressed: (){
              addData();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context)=>Home()),
              );
            },
          ),
        ],
      ),
    );
  }
}
