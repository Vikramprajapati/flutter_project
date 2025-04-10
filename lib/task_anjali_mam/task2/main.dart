import 'package:flutter/material.dart';
import 'package:flutter_practical/task_anjali_mam/task2/screen/detail_screen.dart';
import 'package:flutter_practical/task_anjali_mam/task2/screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
