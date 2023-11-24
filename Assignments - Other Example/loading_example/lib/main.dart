import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Loading Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _isLoading = false;

  _startLoading() {
    setState(() { _isLoading = true; });

    Timer(const Duration(seconds: 5), () {
      setState(() { _isLoading = false; });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Circular Progress Indicator'),
        ),
        body: Center(
          child: _isLoading
              ? const CircularProgressIndicator()
              : ElevatedButton(onPressed: _startLoading, child: const Text('Start Loading')),
        ));
  }
}