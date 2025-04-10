import 'package:flutter/material.dart';

import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Change Theme using GetX'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.changeTheme(ThemeData.light());
                  },
                  child: Text("Light Theme")),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.changeTheme(ThemeData.dark());
                  },
                  child: Text("Dark Theme"))
            ],
          ),
        ),
      ),
    );
  }
}
