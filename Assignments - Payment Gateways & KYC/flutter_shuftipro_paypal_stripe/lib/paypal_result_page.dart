import 'package:flutter/material.dart';
class PaypalResultPage extends StatefulWidget {

  Map params;
  PaypalResultPage(this.params);

  @override
  State<PaypalResultPage> createState() => PaypalResultPageState(this.params);
}

class PaypalResultPageState extends State<PaypalResultPage> {

  Map params;
  PaypalResultPageState(this.params);

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