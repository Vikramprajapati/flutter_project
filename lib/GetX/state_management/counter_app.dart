import 'package:flutter/material.dart';
import 'package:flutter_practical/GetX/state_management/counter_contoller.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  CounterContoller contoller = Get.put(CounterContoller());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              contoller.count.value.toString(),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {
                    contoller.decrease();

                  }, child: Text("-")),

                  ElevatedButton(onPressed: () {
                    contoller.increase();

                  }, child: Text("+")),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
