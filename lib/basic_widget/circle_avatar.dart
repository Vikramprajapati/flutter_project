import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Circle Avatar Widget"),
          centerTitle: true,

        ),
        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: Colors.black,

                child:  CircleAvatar(
                    radius: 76,
                    backgroundImage: AssetImage("assets/images/image.jpeg"),
              ),
                        ),
              SizedBox(height: 10,),

          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.black,
            backgroundImage: AssetImage("assets/images/image.jpeg"),



          ),

            ],
          ),

        ),
      ),
      );
  }
}
