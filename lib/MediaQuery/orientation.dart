import 'package:flutter/material.dart';

class Orientation_screen extends StatelessWidget {
  const Orientation_screen({super.key});

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Orientation of UI"),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          if (_mediaQuery.orientation == Orientation.portrait) {
            return portraitScreen(_mediaQuery.size);
          } else {
            return landScapeScreen(_mediaQuery.size);
          }
        },
      ),
    );
  }

  Widget landScapeScreen(Size size) {
    return Center(
      child: Container(
        width: size.width*0.5,
        height: size.height*0.5,
        color: Colors.black,
      ),
    );
  }

  Widget portraitScreen(Size size) {
    return Center(
      child: Container(
        width: size.width*0.5,
        height: size.height*0.5,
        color: Colors.red,
      ),
    );
  }
}
