import 'package:flutter/material.dart';
import 'package:flutter_practical/MediaQuery/orientation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Orientation_screen(),
    );
  }
}
