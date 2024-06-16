import 'package:flutter/material.dart';
import 'package:flutteros_mad2/pages/feedback.dart';
import 'package:flutteros_mad2/pages/viewdetails.dart';
import 'package:flutteros_mad2/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false,
      burger = false,
      drink = false,
      cake = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello Sukaina,",
                    style: AppWidget.boldTextFieldStyle(),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Feedbacks()),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.feedback,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                "Delicious Food",
                style: AppWidget.HeadTextFieldStyle(),
              ),
              Text(
                "Discover and Get Great Food",
                style: AppWidget.LightTextFieldStyle(),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewDetails()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(right: 20.0),
                  child: showItem(),
                ),
              ),
              SizedBox(height: 20.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildFoodCard("Crazy Mac Burger", "Just Baked Freshly",
                        "images/burger4.jpg", "Rs. 1250"),
                    SizedBox(width: 13.0),
                    buildFoodCard("Mac Spicy Burger", "Spicy & Juicy",
                        "images/burger4.jpg", "Rs. 1250"),
                    SizedBox(width: 13.0),
                    buildFoodCard("Mac Spicy Burger", "Spicy & Juicy",
                        "images/burger4.jpg", "Rs. 1250"),
                    SizedBox(width: 13.0),
                    buildFoodCard("Mac Spicy Burger", "Spicy & Juicy",
                        "images/burger4.jpg", "Rs. 1250"),
                    SizedBox(width: 13.0),
                    buildFoodCard("Mac Spicy Burger", "Spicy & Juicy",
                        "images/burger4.jpg", "Rs. 1250"),
                    SizedBox(width: 13.0),
                    buildFoodCard("Mac Spicy Burger", "Spicy & Juicy",
                        "images/burger4.jpg", "Rs. 1250"),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              buildFoodCardRow(), // This should be here
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFoodCard(String title, String subtitle, String imagePath,
      String price) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ViewDetails()),
        );
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: Image.asset(
                    imagePath,
                    height: 140,
                    width: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(title, style: AppWidget.SemiBoldTextFieldStyle()),
                SizedBox(height: 5.0),
                Text(subtitle, style: AppWidget.LightTextFieldStyle()),
                SizedBox(height: 5.0),
                Text(price, style: AppWidget.SemiBoldTextFieldStyle()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFoodCardRow() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ViewDetails()),
        );
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "images/burger4.jpg",
                        height: 140,
                        width: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Double Twister Burger",
                              style: AppWidget.SemiBoldTextFieldStyle()),
                          SizedBox(height: 5.0),
                          Text("Honey goat cheese",
                              style: AppWidget.LightTextFieldStyle()),
                          SizedBox(height: 5.0),
                          Text(
                              "Rs. 1550", style: AppWidget.LightTextFieldStyle()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "images/burger4.jpg",
                        height: 140,
                        width: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Double Twister Burger",
                              style: AppWidget.SemiBoldTextFieldStyle()),
                          SizedBox(height: 5.0),
                          Text("Honey goat cheese",
                              style: AppWidget.LightTextFieldStyle()),
                          SizedBox(height: 5.0),
                          Text(
                              "Rs. 1550", style: AppWidget.LightTextFieldStyle()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "images/burger4.jpg",
                        height: 140,
                        width: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Double Twister Burger",
                              style: AppWidget.SemiBoldTextFieldStyle()),
                          SizedBox(height: 5.0),
                          Text("Honey goat cheese",
                              style: AppWidget.LightTextFieldStyle()),
                          SizedBox(height: 5.0),
                          Text(
                              "Rs. 1550", style: AppWidget.LightTextFieldStyle()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "images/burger4.jpg",
                        height: 140,
                        width: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Double Twister Burger",
                              style: AppWidget.SemiBoldTextFieldStyle()),
                          SizedBox(height: 5.0),
                          Text("Honey goat cheese",
                              style: AppWidget.LightTextFieldStyle()),
                          SizedBox(height: 5.0),
                          Text(
                              "Rs. 1550", style: AppWidget.LightTextFieldStyle()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "images/burger4.jpg",
                        height: 140,
                        width: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Double Twister Burger",
                              style: AppWidget.SemiBoldTextFieldStyle()),
                          SizedBox(height: 5.0),
                          Text("Honey goat cheese",
                              style: AppWidget.LightTextFieldStyle()),
                          SizedBox(height: 5.0),
                          Text(
                              "Rs. 1550", style: AppWidget.LightTextFieldStyle()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "images/burger4.jpg",
                        height: 140,
                        width: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Double Twister Burger",
                              style: AppWidget.SemiBoldTextFieldStyle()),
                          SizedBox(height: 5.0),
                          Text("Honey goat cheese",
                              style: AppWidget.LightTextFieldStyle()),
                          SizedBox(height: 5.0),
                          Text(
                              "Rs. 1550", style: AppWidget.LightTextFieldStyle()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "images/burger4.jpg",
                        height: 140,
                        width: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Double Twister Burger",
                              style: AppWidget.SemiBoldTextFieldStyle()),
                          SizedBox(height: 5.0),
                          Text("Honey goat cheese",
                              style: AppWidget.LightTextFieldStyle()),
                          SizedBox(height: 5.0),
                          Text(
                              "Rs. 1550", style: AppWidget.LightTextFieldStyle()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIcon(String imagePath, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(4),
          margin: EdgeInsets.all(4),
          child: Image.asset(
            imagePath,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }


  Widget showItem() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildIcon("images/ice-cream.png", icecream, () {
            setState(() {
              icecream = true;
              burger = false;
              drink = false;
              cake = false;
            });
          }),
          SizedBox(width: 32.0),
          buildIcon("images/burger1.png", burger, () {
            setState(() {
              icecream = false;
              burger = true;
              drink = false;
              cake = false;
            });
          }),
          SizedBox(width: 32.0),
          buildIcon("images/drink1.png", drink, () {
            setState(() {
              icecream = false;
              burger = false;
              drink = true;
              cake = false;
            });
          }),
          SizedBox(width: 32.0),
          buildIcon("images/cake.png", cake, () {
            setState(() {
              icecream = false;
              burger = false;
              drink = false;
              cake = true;
            });
          }),
        ],
      ),
    );
  }
}