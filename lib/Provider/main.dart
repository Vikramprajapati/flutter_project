import 'package:flutter/material.dart';
import 'package:flutter_practical/Provider/counter/counter_provider.dart';
import 'package:flutter_practical/Provider/counter/counter_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ChangeNotifierProvider(
        create: (context) => CounterProvider(),
        child: CounterScreen(),
      ),
    );
  }
}
