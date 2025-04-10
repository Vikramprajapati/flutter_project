import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.grey,
            appBar: AppBar(
              title: Text("Container "),
              centerTitle: true,
            ),
            body: Center(
              child: Container(
                //color: Colors.blue,

                width: 300,
                height: 300,

                /*margin: EdgeInsets.fromLTRB(50, 10, 50,20),*/
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 15),

                alignment: Alignment.center,
                /*alignment:Alignment.topCenter,*/

                child: const Text(
                  "Hello World",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  /* border: Border.all(
                    color: Colors.black,
                    width: 50,
                    //style: BorderStyle.solid
                      strokeAlign: BorderSide.strokeAlignCenter

                  ),*/

                  /* borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(8, 9)
                    )

                  ],*/
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Colors.red, Colors.black, Colors.white],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topRight),
                ),

                transform: Matrix4.rotationZ(0.1),
              ),
            )));
  }
}
