import 'package:flutter/material.dart';
import 'package:flutteros_mad2/service/database.dart';
import 'package:flutteros_mad2/service/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';



class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List<Map<String, dynamic>> _cartItems = [];
  String? wallet;
  String? id;

  @override
  void initState() {
    super.initState();
    _loadCartItems();
    _loadWalletInfo();
  }

  Future<void> _loadCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cartItemsString = prefs.getString('cart_items');

    if (cartItemsString != null) {
      setState(() {
        _cartItems = List<Map<String, dynamic>>.from(json.decode(cartItemsString));
      });
    }
  }

  Future<void> _loadWalletInfo() async {
    wallet = await SharedPreference().getUserWallet();
    id = await SharedPreference().getUserId();
    setState(() {});
  }

  Future<void> _removeFromCart(int index) async {
    setState(() {
      _cartItems.removeAt(index);
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('cart_items', json.encode(_cartItems));
  }

  double _calculateTotalAmount() {
    double total = 0;
    for (var item in _cartItems) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  void _confirmOrder() async {
    double totalAmount = _calculateTotalAmount();
    if (double.parse(wallet!) >= totalAmount) {
      // Deduct the total amount from the wallet
      int updatedWalletBalance = int.parse(wallet!) - totalAmount.toInt();
      await SharedPreference().saveUserWallet(updatedWalletBalance.toString());
      await Database().updateUserWallet(id!, updatedWalletBalance.toString());

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Order Confirmed"),
          content: Text("Your food is on the way"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        ),
      );

      // Clear the cart items after order confirmation
      setState(() {
        _cartItems.clear();
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('cart_items');
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Insufficient Balance"),
          content: Text("You do not have enough balance in your wallet."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(_cartItems[index]['image']),
                  ),
                  title: Text(_cartItems[index]['name']),
                  subtitle: Text(
                    'Quantity: ${_cartItems[index]['quantity']} x Rs. ${_cartItems[index]['price']}',
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      _removeFromCart(index);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rs. ${_calculateTotalAmount().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _confirmOrder,
                child: Text('Confirm Order'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
