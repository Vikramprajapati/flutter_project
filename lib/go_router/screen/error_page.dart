import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Not Found"),
      ),
      body: Container(
        child: Text("Page Not Found"),
      ),
    );
  }
}
