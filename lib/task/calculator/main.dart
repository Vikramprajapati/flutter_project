import 'package:flutter/material.dart';

import 'my_calculator.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MyCalculator(),
    );
  }
}
