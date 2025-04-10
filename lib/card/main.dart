import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Card Widget'),
        ),
        body: Center(
          child: Card(
            elevation: 20,
            shadowColor: Colors.red,
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
