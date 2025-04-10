import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Column Widget",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Column Widget"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: InkWell(
            onTap: () => print("Black"),
            onDoubleTap:() => print('Double'),
            onLongPress: () => print("long"),
            child: Container(
              color: Colors.black,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                  width: 100,
                  height: 100,
                  color: Colors.black,
                ),
                  Container(
                    width: 300,
                    height: 100,
                    color: Colors.green,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.black,
                  ),
                  Container(
                    width: 300,
                    height: 100,
                    color: Colors.green,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.black,
                  ),
                  Container(
                    width: 300,
                    height: 100,
                    color: Colors.green,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.black,
                  ),
                  Container(
                    width: 300,
                    height: 100,
                    color: Colors.green,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.black,
                  )],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
