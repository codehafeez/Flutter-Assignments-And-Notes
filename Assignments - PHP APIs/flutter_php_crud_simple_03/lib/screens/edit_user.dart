import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_php_crud_simple/screens/env.dart';
import 'package:flutter_php_crud_simple/screens/read_users.dart';
import 'package:http/http.dart' as http;
class EditUser extends StatefulWidget {

  List user = [];
  EditUser({Key? key,required this.user}) : super(key: key);

  @override
  _EditUserState createState() => new _EditUserState();
}

class _EditUserState extends State<EditUser> {

  TextEditingController input_name = new TextEditingController();
  TextEditingController input_phone = new TextEditingController();
  TextEditingController input_email = new TextEditingController();
  TextEditingController input_age = new TextEditingController();

  @override
  initState(){
    input_name.text = widget.user[0]['name'];
    input_phone.text = widget.user[0]['phone'];
    input_email.text = widget.user[0]['email'];
    input_age.text = widget.user[0]['age'];
  }

  Future updateDataFunction() async {
    String url = baseUrl+"update_user.php";
    String id = widget.user[0]['id'];
    var data = {
      "id": id,
      "name": input_name.text,
      "phone": input_phone.text,
      "email": input_email.text,
      "age": input_age.text,
    };

    var response = await http.post(Uri.parse(url), body: json.encode(data));
    var returnData = jsonDecode(response.body);

    errorMsgFunction(context, returnData['message'].toString());
    // Navigator.pop(context);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => ReadUsers()), (route) => false);
  }

  showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Item"),
          content: Text("Do you want to delete this item ?"),
          actions: [
            FlatButton(
              child: Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop();
                deleteDataFunction();
              },
            ),
            FlatButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future deleteDataFunction() async {
    String id = widget.user[0]['id'];
    String url = baseUrl+"delete_user.php";
    var data = { "id": id };
    var response = await http.post(Uri.parse(url), body: json.encode(data));
    var returnData = jsonDecode(response.body);

    errorMsgFunction(context, returnData['message'].toString());
    // Navigator.pop(context);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => ReadUsers()), (route) => false);
  }

  void errorMsgFunction(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Edit Data - PHP MySQL")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: input_name,
                  decoration: new InputDecoration(
                      hintText: "Name",
                      labelText: "Name"
                  ),
                ),
                new TextField(
                  controller: input_phone,
                  decoration: new InputDecoration(
                      hintText: "Phone",
                      labelText: "Phone"
                  ),
                    keyboardType: TextInputType.number
                ),
                new TextField(
                  controller: input_email,
                  decoration: new InputDecoration(
                      hintText: "Email",
                      labelText: "Email"
                  ),
                ),
                new TextField(
                  controller: input_age,
                  decoration: new InputDecoration(
                      hintText: "Age",
                      labelText: "Age"
                  ),
                    keyboardType: TextInputType.number
                ),
                Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          if (input_name.value.text.isEmpty) {
                            setState(() {
                              errorMsgFunction(context, "Please enter name.");
                            });
                          }
                          else if (input_phone.value.text.length < 8) {
                            setState(() {
                              errorMsgFunction(context, "Please enter valid phone.");
                            });
                          }
                          else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(input_email.text)) {
                            setState(() {
                              errorMsgFunction(context, "Please enter valid email.");
                            });
                          }
                          else if (input_age.value.text.isEmpty) {
                            setState(() {
                              errorMsgFunction(context, "Please enter age.");
                            });
                          }
                          else { updateDataFunction(); }
                        },
                        child: new Text(
                          "Update",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          showAlertDialog(context);
                        },
                        child: new Text(
                          "Delete",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
