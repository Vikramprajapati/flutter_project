import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practical/figma/screen/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  
  @override
    void initState() {
        super.initState();
        Timer(Duration(seconds: 5), () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
        },);
      }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue.shade400,
            Colors.blue.shade900
          ],
          begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/figma_image/Travel.png"),
                  SizedBox(width: 15,),
                  Image.asset("assets/figma_image/logo.png",),

                ],
              ),
              SizedBox(height: 50,),
              Text("Find Your Dream",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
              Text("Destination With US",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}
