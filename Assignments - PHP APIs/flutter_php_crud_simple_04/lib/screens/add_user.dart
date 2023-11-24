import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_php_crud_simple/screens/env.dart';
import 'package:http/http.dart' as http;

import 'read_users.dart';
class AddUser extends StatefulWidget {

  @override
  _AddUserState createState() => new _AddUserState();
}

class _AddUserState extends State<AddUser> {

  TextEditingController input_name = new TextEditingController();
  TextEditingController input_phone = new TextEditingController();
  TextEditingController input_email = new TextEditingController();
  TextEditingController input_age = new TextEditingController();

  Future addDataFunction() async {
    String url = baseUrl+"add_user.php";
    var data = {
      "name": input_name.text,
      "phone": input_phone.text,
      "email": input_email.text,
      "age": input_age.text,
    };

    var response = await http.post(Uri.parse(url), body: json.encode(data));
    var returnData = jsonDecode(response.body);

    errorMsgFunction(context, returnData['message'].toString());
    // Navigator.pop(context);
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
      return ReadUsers();
    }));
  }

  void errorMsgFunction(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error),
        backgroundColor: Colors.deepOrange,
        // action: SnackBarAction(label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Add Data - PHP MySQL")),
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
                      child: MaterialButton(
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
                          else { addDataFunction(); }
                        },
                        child: new Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.pink,
                      ),
                    )
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
