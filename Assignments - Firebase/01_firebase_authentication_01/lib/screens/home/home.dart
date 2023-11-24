import 'package:firebase_example/constants/constants.dart';
import 'package:firebase_example/services/auth_service.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final AuthService _authService = AuthService();
   
 @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondary,
        appBar: AppBar(
          title: Text('Firebase Login Example'),
          backgroundColor:primary,
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              style: TextButton.styleFrom(
                primary: secondary,
              ),
              label: Text('Sign out'),
              onPressed: ()async {
                await _authService.signOut();
              },
            )
          ],
        ),
      );
  }
}