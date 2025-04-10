import 'package:flutter/material.dart';
import 'package:flutter_practical/go_router/router_constants.dart';
import 'package:go_router/go_router.dart';

class AboutScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        centerTitle: true,
      ),
      body:Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("About Screen"),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(onPressed: () {
              GoRouter.of(context).pushNamed(MyAppRouteConstants.homeRouteName);
            }, child: Text("Go to Home")),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(onPressed: () {
              GoRouter.of(context).pushNamed(MyAppRouteConstants.profileRouteName);
            }, child: Text("Go to Profile")),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(onPressed: () {
              GoRouter.of(context).pushNamed(MyAppRouteConstants.contactRouteName);
            }, child: Text("Go to Contact"))
          ],
        ),
      ),
    );
  }
}
