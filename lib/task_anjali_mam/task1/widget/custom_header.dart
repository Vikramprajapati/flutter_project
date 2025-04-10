import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 200,
      decoration: BoxDecoration(
          color: Color(0xFF007E6E),
          borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style:
                      TextStyle(color: Colors.white.withOpacity(0.5)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.yellow,
                        ),
                        Text("New York, USA",
                            style: TextStyle(color: Colors.white)),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.yellow.withOpacity(0.7),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5)),
                      child:
                      Icon(Icons.shopping_cart, color: Colors.white),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(5)),
                        child: Icon(
                          Icons.notification_add,
                          color: Colors.white,
                        ))
                  ],
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                  ),
                  hintText: "Search",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            )
          ],
        ),
      ),
    );
  }
}
