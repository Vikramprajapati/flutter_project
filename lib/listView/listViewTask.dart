import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView',
      home: Scaffold(
          appBar: AppBar(
            title: Text('ListView'),
          ),
          body: SingleChildScrollView(
    child: Column(
    children: [
    Container(
    // color: Colors.grey,
    height: 130,
    child: ListView(
    scrollDirection: Axis.horizontal,
    children: [
    CircleAvatar(
    backgroundColor: Colors.black87,
    radius: 60,
    ),
    SizedBox(
    width: 10,
    ),
    CircleAvatar(
    backgroundColor: Colors.red,
    radius: 60,
    ),
    SizedBox(
    width: 10,
    ),
    CircleAvatar(
    backgroundColor: Colors.grey,
    radius: 60,
    ),
    SizedBox(
    width: 10,
    ),
    CircleAvatar(
    backgroundColor: Colors.purple,
    radius: 60,
    ),
    ],
    ),
    ),
    SizedBox(height: 30,),

            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),

              children: [
                Container(
                  height: 150,
                  color: Colors.black87,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 150,
                  color: Colors.red,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 150,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 150,
                  color: Colors.purple,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 150,
                  color: Colors.black87,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 150,
                  color: Colors.red,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 150,
                  color: Colors.grey,
                ),
              ],
            ),



        ],
    ),
    ),
    ));
  }
}
