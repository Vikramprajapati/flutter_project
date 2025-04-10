import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(

       appBar: AppBar(
         title: Text("Column Expanded Widget"),
         centerTitle: true,
       ),

        body: Center(

          child: Container(
           // height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.orange,

                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.black,

                  ),
                ),
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.blue,

                )
              ],


            ),
          ),
        ),
      ),

    );
  }
}
