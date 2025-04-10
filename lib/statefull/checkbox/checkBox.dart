
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
  bool isChecked=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("CheckBox Example"),
          centerTitle: true,
        ),
        body: Column(
          children: [Center(
            child: Checkbox(value: isChecked, onChanged: (value) {
              setState(() {
                isChecked=value!;
              });
            },
            activeColor: Colors.yellow,),
          ),
            Text(isChecked ? "Selected" : "Not Selected"),
        ]),
      )
    );
  }
}

