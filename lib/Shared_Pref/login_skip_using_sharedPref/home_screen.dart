import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Welcome To Home Page",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
