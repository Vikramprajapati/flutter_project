import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                height: Get.height *0.8,
                width: Get.width * 0.5,
                color: Colors.red,
              ),
              Container(
               height: Get.height * .7,
               width: Get.width * 0.8,
                color: Colors.blueAccent,
              )
            ],
          ),
        )
      ),
    );
  }
}
