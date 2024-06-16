import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutteros_mad2/pages/home.dart';
import 'package:flutteros_mad2/pages/order.dart';
import 'package:flutteros_mad2/pages/profile.dart';
import 'package:flutteros_mad2/pages/wallet.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late Home homepage;
  late Profile profile;
  late Order order;
  late Wallet wallet; //wallet


@override
  void initState() {
    // TODO: implement initState
    homepage = Home();
    order = Order();
    profile = Profile();
    wallet = Wallet();
    pages = [homepage, order, wallet, profile];
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index){
          setState(() {
            currentTabIndex = index;
          });
        },
        items: [
        Icon(
          Icons.home_outlined, color: Colors.white,
        ),
        Icon(
          Icons.shopping_bag_outlined, color: Colors.white,
        ),
        Icon(
          Icons.wallet_outlined, color: Colors.white,
        ),
        Icon(
          Icons.person_outline, color: Colors.white,
        ),


      ]),
      body: pages[currentTabIndex],
    );
  }
}
