import 'package:flutter/material.dart';
import 'package:flutter_practical/go_router/router_constants.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text("Home Screen"),
            ),
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
              GoRouter.of(context).pushNamed(MyAppRouteConstants.aboutRouteName);
            }, child: Text("Go to About")),
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
