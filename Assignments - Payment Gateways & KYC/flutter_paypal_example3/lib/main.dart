import 'package:flutter/material.dart';
import 'package:live_currency_rate/live_currency_rate.dart';
import 'package:paypal_example1/paypal_lib/flutter_paypal.dart';
import 'package:paypal_example1/result_page.dart';

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
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("PayPal Payment")),
        body: Center(
          child: TextButton(
              onPressed: () => {
                pay_function(),
              },
              child: Text("Click to Make Payment", style: TextStyle(fontSize:24))),
        ));
  }

  void pay_function() {

    double total_price = 10.20;
    double item_price = 5.10;

    var itemList = [];
    var item = <String, dynamic>{};
    for(var i=0; i<2; i++){
      item.addAll({
        "name": "test product "+i.toString(),
        "quantity": 1,
        "price": item_price,
        "currency": "USD"
      });
      itemList.add(item);
    }
    print(itemList);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => UsePaypal(
            sandboxMode: true,
            clientId: "**************************************************",
            secretKey: "*************************************************",
            returnURL: "https://samplesite.com/return",
            cancelURL: "https://samplesite.com/cancel",
            transactions: [{
              "amount": {
                "total": total_price,
                "currency": "USD",
                "details": {
                  "subtotal": total_price,
                  "shipping": 0,
                  "shipping_discount":0
                }
              },
              "description":"The payment transaction description.",
              "item_list": {
                "items": itemList,
                // "items": [
                //   {
                //     "name": "Product Item 01",
                //     "quantity": 1,
                //     "price": item_price,
                //     "currency": "USD"
                //   },
                //   {
                //     "name": "Product Item 02",
                //     "quantity": 1,
                //     "price": item_price,
                //     "currency": "USD"
                //   }
                // ],
                "shipping_address":{
                  "recipient_name": "Abdul-Hafeez",
                  "line1": "Sukkur Pakistan",
                  "line2": "",
                  "city": "Sukkur",
                  "country_code": "PK",
                  "postal_code": "73301",
                  "phone": "+00000000",
                  "state": "Texas"
                },
              }
            }],
            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) {
              print("Result => $params");
              // print("Payment ID => "+params['paymentId']);
            },
            onError: (error) {
              print("onError: $error");
            },
            onCancel: (params) {
              print('cancelled: $params');
            }),
      ),
    );
  }
}