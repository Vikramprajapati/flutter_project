import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final textStyle = TextStyle(fontSize: 18);

  int count=0;

  void _decreaseCount() {
   setState(() {
     count--;
     print(count);
   });
  }

  void _increaseCount() {
    setState(() {
      count++;
      print(count);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Counter Application"),
          centerTitle: true,
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [FilledButton(onPressed: () {
                _decreaseCount();
              }, child: (
                  Text("-",style: textStyle,)
              ),
              ),
                
                Text("$count",style: textStyle,),

                FilledButton(onPressed: (){
                  _increaseCount();
                }, child: Text("+",
                style: textStyle,))

              ]
          ),
        ),
      ),
    );
  }
}


