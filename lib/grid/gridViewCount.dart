import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Color> colorList = [
      Colors.teal,
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.green,
      Colors.grey,
      Colors.pink,
      Colors.purple,
      Colors.teal,
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Grid Layout'),
          centerTitle: true,
        ),
        body: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            Container(
              color: colorList[0],
            ),
            Container(
              color: colorList[1],
            ),
            Container(
              color: colorList[2],
            ),
            Container(
              color: colorList[3],
            ),
            Container(
              color: colorList[4],
            ),
            Container(
              color: colorList[5],
            ),
            Container(
              color: colorList[6],
            ),
            Container(
              color: colorList[7],
            )
          ],
        ),
      ),
    );
  }
}
