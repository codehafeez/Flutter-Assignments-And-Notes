import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StripeCheckout extends StatefulWidget {

  @override
  State<StripeCheckout> createState() => StripeCheckoutState();
}

var SECRET_KEY = "sk_test_51M7kn7EjadYuf5noGu6x0SCX34lTpCrzvt2Hdtmnb5MIZrT4IskqH2quWaVsH0RfymJfINE0CztABqWguzdenzdF00cbkoHAvW";
class StripeCheckoutState extends State<StripeCheckout> {

  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stripe Payment')),
      body: Center(
        child: TextButton(
          child: Text('Click to Make Payment'),
          onPressed: () { makePayment(); },
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent();
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(paymentIntentClientSecret: paymentIntent!['client_secret'], style: ThemeMode.dark, merchantDisplayName: 'The Gold Company')).then((value){
      });
      displayPaymentSheet();
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("paid successfully")));
        paymentIntent = null;
      }).onError((error, stackTrace){
        print('Error is:--->$error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(context: context, builder: (_) => const AlertDialog(content: Text("Cancelled ")));
    } catch (e) {
      print('$e');
    }
  }

  createPaymentIntent() async {
    var total_amount = (49.3 * 100).round();
    try {
      Map<String, dynamic> body = {
        'amount': total_amount.toString(),
        'currency': 'USD',
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $SECRET_KEY',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }
}
