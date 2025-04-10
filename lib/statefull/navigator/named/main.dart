import 'package:flutter/material.dart';
import 'package:flutter_practical/statefull/navigator/named/first_page.dart';
import 'package:flutter_practical/statefull/navigator/named/second_page.dart';
import 'package:flutter_practical/statefull/navigator/named/third_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routing',
      initialRoute: '/',
      routes: {
        '/': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
        '/third': (context) => ThirdPage(),
      },
    );
  }
}
