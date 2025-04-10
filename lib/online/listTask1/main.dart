import 'package:flutter/material.dart';
import 'package:flutter_practical/online/listTask1/food_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: FoodList(),
    );
  }
}
