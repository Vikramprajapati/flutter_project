import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practical/FIREBASE/Authentication/EMAIL_PASSWORD/login_page.dart';
import 'package:flutter_practical/FIREBASE/Authentication/OTP_AUTHENTICATION/phone_authentication.dart';
import 'package:flutter_practical/FIREBASE/Authentication/EMAIL_PASSWORD/splash_screen.dart';
import 'package:flutter_practical/FIREBASE/Realtime_Database/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: SplashScreen(),
    );
  }
}
