import 'package:flutter/material.dart';
import 'paypal_lib/flutter_paypal.dart';

class PaypalCheckout extends StatefulWidget {

  @override
  State<PaypalCheckout> createState() => PaypalCheckoutState();
}

class PaypalCheckoutState extends State<PaypalCheckout> {

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
            clientId: "AUjjxhu9m83H-l25DHXIFRQOYaj6Ew_L882eKx1DZn1Fq0yRclKEIFVWj73SKoBzOpK8agK3PHzbrLL6",
            secretKey: "ENSHSNBXSeDUm_P_3AAIoML9FR6GSYLvy0qKiGOcIRVODwShMDGGL1XzKWb32sgUxs_5PQrXjrNNmiUP",
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