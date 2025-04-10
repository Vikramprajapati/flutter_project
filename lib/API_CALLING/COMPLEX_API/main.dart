import 'package:flutter/material.dart';
import 'package:flutter_practical/API_CALLING/COMPLEX_API/screen/category_list.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CategoryScreen(),
    );
  }
}
