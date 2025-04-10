import 'package:flutter/material.dart';
import 'package:flutter_practical/figma/screen/home_screen.dart';
import 'package:flutter_practical/figma/screen/splash_screen.dart';
import 'package:flutter_practical/figma/screen/widget/place_detail.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(MyApp());

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
