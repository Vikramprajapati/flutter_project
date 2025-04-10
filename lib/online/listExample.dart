import 'package:flutter/material.dart';
import 'package:flutter_practical/online/MyDynamicList.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home:MyDynamicList() ,
    );
  }
}
