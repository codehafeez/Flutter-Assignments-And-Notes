import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker.pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() { this.image = imageTemp; });
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker.pickImage(source: ImageSource.camera);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() { this.image = imageTemp; });
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
  
  Future uploadImageFunction() async {
    final postUri = Uri.parse("https://perfectvisionksa.com/api/image_upload.php");
    var request = http.MultipartRequest('POST', postUri);
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'image',
        image!.readAsBytes().asStream(),
        image!.lengthSync(),
        filename:image!.path.split('/').last,
      ),
    );
    request.headers.addAll(headers);
    var res = await request.send();
    var response_result  = await http.Response.fromStream(res);
    var returnData = jsonDecode(response_result.body);
    print(returnData['image_name']);
    print(returnData['message']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Image Picker Camera & Gallery")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            MaterialButton(
                color: Colors.blue,
                child: const Text("Pick Image from Gallery",
                    style: TextStyle(
                    color: Colors.white70, fontWeight: FontWeight.bold)
                ),
                onPressed: () { pickImage(); }
            ),
            MaterialButton(
                color: Colors.blue,
                child: const Text("Pick Image from Camera",
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.bold
                    )
                ),
                onPressed: () { pickImageC(); }
            ),

            SizedBox(height: 20,),

            image != null ? Image.file(image!, width: 300, height: 300,): Text("No image selected"),

            SizedBox(height: 40,),
            MaterialButton(
                color: Colors.blue,
                child: const Text("Upload Image",
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.bold
                    )
                ),
                onPressed: () { uploadImageFunction(); }
            ),
          ],
        )
    );
  }
}
