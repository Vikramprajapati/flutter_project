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
        body: GridView.builder(
          itemCount: colorList.length,
          gridDelegate:
              SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100,crossAxisSpacing: 10,mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return Container(
              color: colorList[index],
            );
          },
        ),
      ),
    );
  }
}
