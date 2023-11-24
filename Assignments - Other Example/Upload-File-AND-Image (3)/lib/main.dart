import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void getHttp() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    var path='';
    var filename='';
    if (result != null) {
      PlatformFile file = result.files.first;
      var path=file.path.toString();
      var filename=file.name;
      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
      var formData = FormData.fromMap({
        'name': '1',
        'age': '2',
        'fileToUpload' : await MultipartFile.fromFile(
            path,
            filename:filename,
            contentType: new MediaType("image", "jpeg")
        ),
      });
      Response response = await Dio().post('https://codehafeez.com/flutter_api/file_upload.php', data: formData);
      print(response.data.toString());
    }
  }
}
