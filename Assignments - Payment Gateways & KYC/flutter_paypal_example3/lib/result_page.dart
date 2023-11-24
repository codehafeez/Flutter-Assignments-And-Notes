import 'package:flutter/material.dart';
class ResultPage extends StatefulWidget {

  Map params;
  ResultPage(this.params);

  @override
  State<ResultPage> createState() => ResultPageState(this.params);
}

class ResultPageState extends State<ResultPage> {

  Map params;
  ResultPageState(this.params);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Result Screen")),
      body: ListView(
        children: [
          ListTile(title: Text("Status : "+params['status'])),
          ListTile(title: Text("Payer ID : "+params['payerID'])),
          ListTile(title: Text("Payment ID : "+params['paymentId'])),
          ListTile(title: Text("Token : "+params['token'])),
        ],
      ),
    );
  }
}