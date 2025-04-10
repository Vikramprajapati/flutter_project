import 'package:flutter/material.dart';
import 'package:flutter_practical/permission/permission_screen.dart';
import 'package:flutter_practical/permission/test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: PermissionScreen(),
    );
  }
}
