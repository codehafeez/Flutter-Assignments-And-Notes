import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_cloudstore/presentation/screens/database/fetch_data.dart';
import 'package:flutter_crud_cloudstore/presentation/screens/database/insert_screen.dart';


class FirebaseDBHome extends StatefulWidget {
  const FirebaseDBHome({Key? key}) : super(key: key);

  @override
  State<FirebaseDBHome> createState() => _FirebaseDBHomeState();
}

class _FirebaseDBHomeState extends State<FirebaseDBHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Firebase'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Image(
              width: 300,
              height: 300,
              image: NetworkImage(
                  'https://seeklogo.com/images/F/firebase-logo-402F407EE0-seeklogo.com.png'),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Firebase Realtime Database Series in Flutter 2022',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InsertData()));
              },
              child: const Text('Insert Data'),
              color: Colors.blue,
              textColor: Colors.white,
              minWidth: 300,
              height: 40,
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                 Navigator.push(context,
                     MaterialPageRoute(builder: (context) => const FetchData()));
              },
              child: const Text('Fetch Data'),
              color: Colors.blue,
              textColor: Colors.white,
              minWidth: 300,
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}