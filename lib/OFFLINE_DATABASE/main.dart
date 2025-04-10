import 'package:flutter/material.dart';
import 'package:flutter_practical/OFFLINE_DATABASE/add_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: AddData(),
    );
  }
}
