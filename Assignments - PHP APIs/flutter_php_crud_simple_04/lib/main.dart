import 'package:flutter/material.dart';
import 'package:flutter_php_crud_simple/screens/add_user.dart';
import 'package:flutter_php_crud_simple/screens/read_users.dart';

void main() {
  runApp(Strapi());
}

class Strapi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter PHP MySQL - CRUD',
        theme: ThemeData(primarySwatch: Colors.blue),
        home:ReadUsers()
    );
  }
}

