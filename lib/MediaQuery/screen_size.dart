import 'package:flutter/material.dart';

class ScreenSize extends StatelessWidget {
  ScreenSize({super.key});

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Ui using MediaQuery'),
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: _mediaQuery.size.width * 0.3,
            height: _mediaQuery.size.height * 0.8,
            color: Colors.red,
          ),
          Container(
            color: Colors.black,
            width: _mediaQuery.size.width * 0.3,
            height: _mediaQuery.size.height * 0.8,
          ),
          Container(
            width: _mediaQuery.size.width * 0.3,
            height: _mediaQuery.size.height * 0.8,
            color: Colors.blue,
          )
        ],
      )),
    );
  }
}
