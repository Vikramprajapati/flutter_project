import 'package:flutter/material.dart';
void main()
{
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var arrNames=["Vikram","Yashmala","Pooja","Dharmendra","Yash",];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView.Builder"),
          centerTitle: true,
        ),
        body: ListView.builder(itemBuilder: (context, index) {
          return Text("${arrNames[index]}");
        },
          itemCount: arrNames.length,
        ),
      ),
    );
  }
}
