import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Rich Text"),
          centerTitle: true,
        ),
        body: Center(
          child: RichText(text: TextSpan(
            text: "Hello",style: TextStyle(fontSize: 18,color: Colors.black),
          children: <TextSpan>[
            TextSpan(text: "Vikram",style: TextStyle(fontSize: 25,color: Colors.red)),
          ])
          ),
        ),
      ),
    );
  }
}
