import 'package:flutter/material.dart';
import 'package:flutter_practical/Widget/snackbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: SnackbarWidget(),
    );
  }
}
