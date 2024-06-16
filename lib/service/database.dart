import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  Future<void> addUser(Map<String, dynamic> userInfoMap, String id) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(id).set(userInfoMap);
      print('User added successfully');
    } catch (e) {
      print('Failed to add user: $e');
    }
  }

  Future<void> updateUserWallet(String id, String amount) async {
    try {
      await FirebaseFirestore.instance.collection("users").doc(id).update({"Wallet": amount});
      print('Wallet updated successfully');
    } catch (e) {
      print('Failed to update wallet: $e');
    }
  }
}
