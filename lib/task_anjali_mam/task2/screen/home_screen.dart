import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practical/task_anjali_mam/task2/widget/category_container.dart';
import 'package:flutter_practical/task_anjali_mam/task2/widget/foodItem.dart';
import 'package:flutter_practical/task_anjali_mam/task2/widget/popular_food.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 24, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.sort_rounded,
                        size: 35,
                      ),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(25)),
                        child: TextField(
                          decoration: InputDecoration(
                              label: Text("Try Biryani", style: TextStyle(
                                  color: Colors.grey[400], fontSize: 12),
                                maxLines: 1,),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "Homemade  ",
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        "Food",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CategoryContainer(
                    selected: selected,
                    callback: (int index) {
                      setState(() {
                        selected = index;
                      });
                    },
                  ),

                  Fooditem(),

                  Text("Popular this week", style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),

                  PopularFood()
                ],
              ),
            ),
          ),
        ));
  }
}
