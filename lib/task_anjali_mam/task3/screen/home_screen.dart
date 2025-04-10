import 'package:flutter/material.dart';
import 'package:flutter_practical/task_anjali_mam/task3/widget/category.dart';
import 'package:flutter_practical/task_anjali_mam/task3/widget/foodMenu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hi Julia",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: Image.asset(
                        "assets/images/Cristiano.jpeg",
                      ))
                ],
              ),
            ),
            Text(
              "      We hope you are in",
              style:
                  TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 17),
            ),
            Text("      good mood for cooking.",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.6), fontSize: 17)),
            SizedBox(
              height: 55,
            ),
            Divider(
              height: 1,
              color: Colors.white.withOpacity(0.1),
            ),
            SizedBox(
              height: 55,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "New dishes",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "  42",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.yellow[300],
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Icon(
                    Icons.sort,
                    color: Colors.yellow[300],
                    size: 35,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Category(),
            ),
            Expanded(child: Foodmenu())
          ],
        ));
  }
}
