import 'package:flutter/material.dart';
import 'package:flutter_practical/API_CALLING/GET_API_WITH_MODEL_AND_SERVICEFOLDER/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomeScreen(),
    );
  }
}
