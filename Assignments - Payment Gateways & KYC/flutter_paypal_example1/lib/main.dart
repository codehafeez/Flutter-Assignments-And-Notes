import 'package:flutter/material.dart';
import 'package:live_currency_rate/live_currency_rate.dart';
import 'package:paypal_example1/flutter_paypal.dart';
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

double total_price = 0;
class MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("PayPal Payment")),
        body: Center(
          child: TextButton(
              onPressed: () => {
                total_price = 19.12,
                change_price(),
              },
              child: Text("Make Payment", style: TextStyle(fontSize:28))),
        ));
  }

  void change_price() async {
    CurrencyRate live_rate = await LiveCurrencyRate.convertCurrency("USD", "AED", total_price.toDouble());
    print("Live Rate : "+live_rate.result.toStringAsFixed(2));
    if(live_rate.result.toString().length > 0){
      pay_function(live_rate.result.toStringAsFixed(2));
    }
  }

  void pay_function(live_rate) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => UsePaypal(
            sandboxMode: true,
            clientId: "**************************************",
            secretKey: "*************************************",
            returnURL: "https://samplesite.com/return",
            cancelURL: "https://samplesite.com/cancel",
            transactions: [{
              "amount": {
                "total": live_rate,
                "currency": "USD",
                "details": {
                  "subtotal": live_rate,
                  "shipping": '0',
                  "shipping_discount":0
                }
              },
              "description":"The payment transaction description.",
              "item_list": {
                "items": [{
                  "name": "A demo product",
                  "quantity": 1,
                  "price": live_rate,
                  "currency": "USD"
                }],
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