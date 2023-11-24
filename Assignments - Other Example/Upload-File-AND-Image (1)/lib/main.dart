import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload File - API"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){ getHttp(); },
        child: const Icon(Icons.add),
      ),
    );
  }

  void getHttp() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    var path='';
    var filename='';
    if (result != null) {
      PlatformFile file = result.files.first;


      final imageTemp = File(file.path.toString());
      // final postUri = Uri.parse("http://ec2-52-90-114-40.compute-1.amazonaws.com:8000/file/upload");
      // final postUri = Uri.parse("http://54.90.210.110:5000/file/upload");
      final postUri = Uri.parse("https://codehafeez.com/flutter_api/image_upload.php");
      var request = http.MultipartRequest('POST', postUri);
      Map<String, String> headers = {"Content-type": "multipart/form-data"};
      request.files.add(
        http.MultipartFile(
          'image',
          imageTemp!.readAsBytes().asStream(),
          imageTemp!.lengthSync(),
          filename:imageTemp!.path.split('/').last,
        ),
      );
      request.headers.addAll(headers);
      var res = await request.send();
      var response_result  = await http.Response.fromStream(res);
      var returnData = jsonDecode(response_result.body);
      print(returnData);



  // OR USE THIS Code both are working fine....



      // var path=file.path.toString();
      // var filename=file.name;
      // var formData = FormData.fromMap({
      //       path,
      //       filename:filename,
      //       contentType: new MediaType("image", "jpeg")
      //   ),
      // });
      // Response response = await Dio().post('https://codehafeez.com/flutter_api/file_upload.php', data: formData);
      // print(response.data.toString());
    }
  }
}
