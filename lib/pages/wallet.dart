import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutteros_mad2/service/database.dart';
import 'package:flutteros_mad2/service/shared_preference.dart';
import 'package:flutteros_mad2/widget/app_constraint.dart';
import 'package:flutteros_mad2/widget/widget_support.dart';
import 'package:http/http.dart' as http;

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  String? wallet, id;
  int? add;
  Map<String, dynamic>? paymentIntent;

  @override
  void initState() {
    super.initState();
    ontheload();
  }

  Future<void> ontheload() async {
    await getthesharedpreference();
    setState(() {});
  }

  Future<void> getthesharedpreference() async {
    wallet = await SharedPreference().getUserWallet();
    id = await SharedPreference().getUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wallet == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 60.0),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 2.0,
                child: Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Center(
                    child: Text("Wallet", style: AppWidget.HeadTextFieldStyle()),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xFFF2F2F2)),
                child: Row(
                  children: [
                    Icon(Icons.account_balance_wallet),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Text("Wallet Balance: \Rs. ${wallet!}", style: AppWidget.boldTextFieldStyle(), overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text("Add Credits", style: AppWidget.SemiBoldTextFieldStyle()),
              ),
              SizedBox(height: 20.0),
              _buildAddCreditsForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddCreditsForm() {
    TextEditingController amountController = TextEditingController();

    return Column(
      children: [
        TextFormField(
          controller: amountController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Enter amount to add',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: () {
            String amount = amountController.text.trim();
            if (amount.isNotEmpty) {
              // For manual wallet update
              addCreditsToWallet(int.parse(amount));
              amountController.clear();

              // For Stripe payment
              makePayment(amount);
            }
          },
          child: Text('Add Credits'),
        ),
      ],
    );
  }

  Future<void> addCreditsToWallet(int amount) async {
    add = int.parse(wallet!) + amount;
    await SharedPreference().saveUserWallet(add.toString());
    await Database().updateUserWallet(id!, add.toString());
    setState(() {
      wallet = add.toString();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Credits added successfully!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> makePayment(String amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'LKR');
      print('Payment Intent: $paymentIntent');
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          style: ThemeMode.dark,
          merchantDisplayName: 'Your Merchant Name',
        ),
      );

      await Stripe.instance.presentPaymentSheet().then((value) async {
        // Handle successful payment here
        addCreditsToWallet(int.parse(amount));
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green),
                    Text("Payment Successful"),
                  ],
                ),
              ],
            ),
          ),
        );
      }).onError((error, stackTrace) {
        // Handle payment error here
        print('Payment Error: $error, Stack Trace: $stackTrace');
      });
    } catch (e, s) {
      // Handle general exception here
      print('Exception: $e, Stack Trace: $s');
    }
  }

  Future<Map<String, dynamic>> createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $secretKey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );
      print('Payment Intent Body ->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
      throw Exception('Failed to create payment intent');
    }
  }

  String calculateAmount(String amount) {
    final calculatedAmount = (int.parse(amount) * 100);
    return calculatedAmount.toString();
  }
}
