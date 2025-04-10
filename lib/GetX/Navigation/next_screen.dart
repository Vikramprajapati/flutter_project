import 'package:flutter/material.dart';
import 'package:get/get.dart';
class NextScreen extends StatelessWidget {
   NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Next Screen"),
            SizedBox(height: 40,),
            ElevatedButton(onPressed: () {
              Get.back();

            }, child: Text("Back"))
          ],
        ),
      ),
    );
  }
}
