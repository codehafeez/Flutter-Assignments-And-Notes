import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(
      MaterialApp(
        home: MyApp(),
      )
  );
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text("Caching and Lazy Loading Images")),
        body: Container(
            padding: EdgeInsets.all(20),
            child:Column(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: "https://www.fluttercampus.com/img/logo_small.webp",
                    imageBuilder: (context, imageProvider) => Container(
                      width: 400,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(), // you can add pre loader iamge as well to show loading.
                    ), //show progress  while loading image
                    errorWidget: (context, url, error) => Image.asset("assets/images/app_logo.png"),
                  ),

                ]
            )
        )
    );
  }
}