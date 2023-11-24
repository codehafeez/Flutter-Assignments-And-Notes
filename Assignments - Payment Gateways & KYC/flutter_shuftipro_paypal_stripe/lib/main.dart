import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuftipro_kyc/paypal_checkout.dart';
import 'package:shuftipro_kyc/stripe_checkout.dart';
import 'package:shuftipro_sdk/shuftipro_sdk.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

String clientId = "5d3032f4f1a0245aa9ab88734eceba680a7fc774e4802c5eff32110e8d818ad9";
String secretKey = "7RQYXaBR9KpEwT4F1xCkeptM1LIGJCoa";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "pk_test_51M7kn7EjadYuf5nooJBH4K1d8iK8O4xcADrmglWOyEWypLXVZQ7y7rcw6JfDcmxXsGwfU7nd7RqhG6alC8zs5ElV00fKf3fVD4";
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

  var authObject = {
    "auth_type": "basic_auth",
    "client_id": clientId,
    "secret_key": secretKey,
  };
  Map<String, Object> createdPayload = {
    "country": "",
    "language": "EN",
    "email": "",
    "callback_url": "http://www.example.com",
    "redirect_url": "https://www.mydummy.package_sample.com/",
    "show_consent": 1,
    "show_privacy_policy": 1,
    "verification_mode": "image_only",
    "face": {},
    "document": {
      "supported_types": [
        "passport",
        "id_card",
        "driving_license",
        "credit_or_debit_card",
      ],
      "name": {
        "first_name": "frstName",
        "last_name": "",
        "middle_name": "",
      },
      "dob": "",
      "document_number": "",
      "expiry_date": "",
      "issue_date": "",
      "fetch_enhanced_data": "",
      "gender": "",
      "backside_proof_required": "0",
    },
  };
  Map<String, Object> configObj = {
    "open_webview": false,
    "asyncRequest": false,
    "captureEnabled": false,
    "dark_mode": false,
    "font_color": "#263B54",
    "button_text_color": "#FFFFFF",
    "button_background_color": "#1F5AF6"
  };

  Future<void> initPlatformState() async {
    String response = '';
    try {
      response = await ShuftiproSdk.sendRequest(authObject: authObject, createdPayload: createdPayload, configObject: configObj);
      ScaffoldMessenger.of(this.context).showSnackBar(SnackBar(content: Text(response)));
    } catch (e) {
      print(e);
    }
    if (!mounted) return;
  }

  void continue_kyc_function() {
    var v = DateTime.now();
    var reference = "package_sample_Flutter_$v";
    createdPayload["reference"] = reference;
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Simple Example Code')),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Text("Shuftipro KYC\nPayPal Payment\nStripe Payment\n\nSimple Example Code\nwww.codehafeez.com", style: TextStyle(fontSize:22, fontWeight:FontWeight.bold),textAlign:TextAlign.center,)),
              SizedBox(height:30),
              Center(
                child: GestureDetector(
                  onTap: () {
                    continue_kyc_function();
                  },
                  child: Container(
                    color: Colors.black,
                    padding: const EdgeInsets.all(14),
                    child: Text('Click to KYC', style: TextStyle(fontSize:18, color:Colors.white, fontWeight:FontWeight.bold)),
                  ),
                ),
              ),
              SizedBox(height:20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PaypalCheckout()));
                  },
                  child: Container(
                    color: Colors.black,
                    padding: const EdgeInsets.all(14),
                    child: Text('Pay with PayPal', style: TextStyle(fontSize:18, color:Colors.white, fontWeight:FontWeight.bold)),
                  ),
                ),
              ),
              SizedBox(height:20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StripeCheckout()));
                  },
                  child: Container(
                    color: Colors.black,
                    padding: const EdgeInsets.all(14),
                    child: Text('Pay with Stripe', style: TextStyle(fontSize:18, color:Colors.white, fontWeight:FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
