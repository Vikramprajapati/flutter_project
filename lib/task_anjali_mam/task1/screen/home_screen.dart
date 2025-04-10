import 'package:flutter/material.dart';
import 'package:flutter_practical/task_anjali_mam/task1/widget/custom_header.dart';
import 'package:flutter_practical/task_anjali_mam/task1/widget/offer_container.dart';
import 'package:flutter_practical/task_anjali_mam/task1/widget/reward_container.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         CustomHeader(),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 26, right: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Special Offers",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(color: Color(0xFF007E6E)),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
               OfferContainer(),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Text("My Reward",style: TextStyle(fontSize: 24),),
                    SizedBox(width: 5,),
                    Text("(3/4)",style: TextStyle(color: Color(0xFF007E6E),fontSize: 24,fontWeight: FontWeight.w400),)
                  ],
                ),
                SizedBox(height: 15,),
                RewardContainer()
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF007E6E),
          unselectedItemColor: Colors.black,
          items: [

            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: "Discover"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Wishlist"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
    );
  }
}
