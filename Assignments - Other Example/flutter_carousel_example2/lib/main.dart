import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
final List<String> imagesList = [
  'https://cdn.pixabay.com/photo/2020/11/01/23/22/breakfast-5705180_1280.jpg',
  'https://cdn.pixabay.com/photo/2016/11/18/19/00/breads-1836411_1280.jpg',
  'https://cdn.pixabay.com/photo/2019/01/14/17/25/gelato-3932596_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/04/04/18/07/ice-cream-2202561_1280.jpg',
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Carousel With Image')),
        body: CarouselSlider(
          options: CarouselOptions(
            // viewportFraction: .6,
            // aspectRatio: 1.2,
            // scrollDirection: Axis.vertical,

            autoPlay: true,
            enlargeCenterPage: true,
          ),
          items: imagesList.map((item) => Card(
            margin: EdgeInsets.only(top: 20, bottom: 10),
            elevation: 6.0,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                item,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          )).toList(),
        ),
      ),
    );
  }
}