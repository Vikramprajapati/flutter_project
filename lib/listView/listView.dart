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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Text("1",style: TextStyle(fontSize: 25),),
            Text("2",style: TextStyle(fontSize: 25)),
            Text("3",style: TextStyle(fontSize: 25)),
            Text("4",style: TextStyle(fontSize: 25)),
            Text("4",style: TextStyle(fontSize: 25)),
          ],
        ),
      ),
    );
  }
}
