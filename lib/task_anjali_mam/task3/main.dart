import 'package:flutter/material.dart';
import 'package:flutter_practical/task_anjali_mam/task3/screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Material App',

      home: HomeScreen(),
    );
  }
}
