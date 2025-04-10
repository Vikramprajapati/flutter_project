import 'package:flutter/material.dart';
import 'package:flutter_practical/GetX/Navigation/next_screen.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Home Screen"),
              SizedBox(height: 40,),
              ElevatedButton(onPressed: () {
                Get.to(NextScreen());

              }, child: Text("Next"))
            ],
          ),
        ),
      ),
    );
  }
}
