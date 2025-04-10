import 'package:flutter/material.dart';
import 'package:flutter_practical/figma/screen/widget/category.dart';
import 'package:flutter_practical/figma/screen/widget/place_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;

  List<String> button = ["Most Viewed", "Nearby", "Latest"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15,
            left: 25,
            right: 15,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Hi, David 👋",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Explore the World",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      )
                    ],
                  ),
                  Container(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        "assets/figma_image/person.png",
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "    Search places",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        child: Image.asset("assets/figma_image/icon.png"),
                      ),
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular places",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Category(
                selected: selected,
                callback: (int index) {
                  setState(() {
                    selected = index;
                  });
                },
              ),

              // Container(
              //   height: 100,
              //   child: ListView.separated(
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         return Container(
              //           child: Text(button[index]),
              //         );
              //       },
              //       separatorBuilder: (context, index) {
              //         return SizedBox(
              //           width: 40,
              //         );
              //       },
              //       itemCount: button.length),
              // ),
              PlaceList()
            ],
          ),
        ),
      ),
    );
  }
}
