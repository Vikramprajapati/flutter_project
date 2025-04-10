import 'package:flutter/material.dart';
import 'package:flutter_practical/Shared_Pref/Notes_App/notes_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: NotesScreen(),
    );
  }
}
