import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_crud_cloudstore/presentation/screens/database/home_database.dart';
import 'package:flutter_crud_cloudstore/presentation/screens/cloudstore/home_page.dart';
import 'package:flutter_crud_cloudstore/presentation/screens/firebaseimage/get_firebase_images.dart';
import 'package:flutter_crud_cloudstore/presentation/screens/firebaseimage/image_home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Firebase_CRUD(),
    );
  }
}








