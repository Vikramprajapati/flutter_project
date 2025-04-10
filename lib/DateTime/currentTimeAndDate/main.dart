import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {


    // create a variable o store current time and date
    var time=DateTime.now();

    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Current Instance'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${time.month}",style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 24,),
              ElevatedButton(onPressed: () {
                setState(() {

                });
              }, child: Text("Current Date and Time"))

            ],
          )
        ),
      ),
    );
  }
}
