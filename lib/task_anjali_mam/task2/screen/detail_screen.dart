import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailScreen extends StatelessWidget {
  Map foodDetail;

  DetailScreen({required this.foodDetail});

  @override
  Widget build(BuildContext context) {
    List ingredients = foodDetail["ingredients"];

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(
        left: 24,
      ),
      child: Column(
        children: [
          Container(
            // color: Colors.grey,
            height: 300,
            child: Stack(children: [
              Positioned(
                top: 5,
                left: -13,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Positioned(
                top: -185,
                right: -95,
                child: Container(
                  height: 500,
                  decoration: BoxDecoration(
                    //color: Colors.grey,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(40)),
                  ),
                  child: CircleAvatar(
                    radius: 200,
                    backgroundImage: AssetImage(foodDetail['image']),
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${foodDetail['name']}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            Text(
                              " ${foodDetail['subTitle']}",
                              style: TextStyle(fontSize: 24),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.grey[600],
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.grey[600],
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.grey[600],
                              size: 20,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.grey[600],
                              size: 20,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              " ${foodDetail['rate']}/5.0",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Color(0xFF5A668B),
                      child: Text(
                        foodDetail['price'],
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  foodDetail['detail'],
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Ingredients",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24),
            child: ListView.separated(
              itemCount: ingredients.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.circle,
                            size: 10,
                            color: foodDetail["name"] == 'Special'
                                ? Colors.green
                                : foodDetail["name"] == 'Banana'
                                    ? Colors.green
                                    : Colors.red),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          ingredients[index],
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Icon(Icons.circle,size: 10,),
                    //     SizedBox(width: 15,),
                    //     Text(ingredients[index],style: TextStyle(fontSize: 12))
                    //   ],
                    // )
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10,
                );
              },
            ),
          )
          ),

           SizedBox(height: 30,),
          Container(
            height: 80,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: foodDetail["name"] == 'Special'
                  ? Colors.blue[100]
                  : foodDetail["name"] == 'Banana'
                  ? Colors.blue[100]
                  : Colors.red[100],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                "Order & Delivery Option",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
