import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutteros_mad2/pages/bottomnav.dart';
import 'package:flutteros_mad2/pages/home.dart';
import 'package:flutteros_mad2/pages/login.dart';
import 'package:flutteros_mad2/pages/onboard.dart';
import 'package:flutteros_mad2/pages/signup.dart';
import 'package:flutteros_mad2/pages/profile.dart';
import 'package:flutteros_mad2/pages/wallet.dart';
import 'package:flutteros_mad2/widget/app_constraint.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = publishableKey;
  await Firebase.initializeApp();

  // Ensure the app supports both portrait and landscape modes
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const OnBoard(),
    );
  }
}
