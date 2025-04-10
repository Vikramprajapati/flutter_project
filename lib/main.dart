import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:  Text("Flutter"),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        
        body: Text('Hello Friends',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
          fontWeight: FontWeight.w900,
          decoration: TextDecoration.combine([TextDecoration.underline,TextDecoration.overline]),

          decorationStyle: TextDecorationStyle.solid,
          decorationColor: Colors.blue,
          shadows: const [
            Shadow(
              offset: Offset(5,5),
              blurRadius: 5,
              color: Colors.black,
            )
          ],
          letterSpacing: 2.0,
          wordSpacing: 10,

           /*backgroundColor: Colors.black,*/
            fontStyle: FontStyle.italic,



          ),

        ),



      ),
    );
  }
}
