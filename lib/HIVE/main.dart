import 'package:flutter/material.dart';
import 'package:flutter_practical/HIVE/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';






void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive
  await Hive.openBox('personsBox'); // Open the box
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
