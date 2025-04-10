import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: TextField(
            decoration: InputDecoration(
              label: Text("Enter name:"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)
              )
            ),
          )
        ),
      ),
    );
  }
}
