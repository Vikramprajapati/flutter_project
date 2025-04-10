import 'package:flutter/material.dart';
import 'package:flutter_practical/task_anjali_mam/task2/screen/detail_screen.dart';

class PopularFood extends StatelessWidget {
  PopularFood({super.key});

  final List<Map<String, dynamic>> popularFood = [
    {
      'name': 'Banana',
      'subTitle': 'Pie Cake',
      'price': '\$3.99',
      'rate': '5.0',
      'image': 'assets/images/food3.jpg',
      'detail':
          "A classic blend of cheddar and jack cheeses, cream and elbow macaroni, nicely blended in bowl handay squid rings lightly battered served with.",
      'ingredients': [
        'Zucchini noodle',
        'Basil pesto and garlic',
        'Grilled chicken',
        'Mushrooms tomato'
      ]
    },
    {
      'name': 'Chicken',
      'subTitle': ' rice Bowl',
      'price': '\$4.99',
      'rate': '4.6',
      'image': 'assets/images/food2.jpg',
      'detail':
          "A classic blend of cheddar and jack cheeses, cream and elbow macaroni, nicely blended in bowl handay squid rings lightly battered served with.",
      'ingredients': [
        'Zucchini noodle',
        'Basil pesto and garlic',
        'Grilled chicken',
        'Mushrooms tomato'
      ]
    },
    {
      'name': 'Special',
      'subTitle': 'rice Bowl',
      'price': '\$5.99',
      'rate': '4.7',
      'image': 'assets/images/food1.jpg',
      'detail':
          "A classic blend of cheddar and jack cheeses, cream and elbow macaroni, nicely blended in bowl handay squid rings lightly battered served with.",
      'ingredients': [
        'Zucchini noodle',
        'Basil pesto and garlic',
        'Grilled chicken',
        'Mushrooms tomato'
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailScreen(foodDetail: popularFood[index]),
                    ));
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 170,
                    width: 200,
                    decoration: BoxDecoration(
                        color: popularFood[index]["name"] == 'Special'
                            ? Colors.blue[100]
                            : popularFood[index]["name"] == 'Banana'
                                ? Colors.blue[100]
                                : Colors.red[100],
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.grey,
                              size: 15,
                            ),
                            Text(
                              " ${popularFood[index]["rate"].toString()}",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          popularFood[index]["name"].toString(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          popularFood[index]["subTitle"].toString(),
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                        ),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    right: 25,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xFF5A668B),
                      child: Text(
                        popularFood[index]["price"].toString(),
                        style: TextStyle(
                            fontSize: 12, color: Colors.white.withOpacity(0.8)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -50,
                    left: 45,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          AssetImage(popularFood[index]['image'].toString()),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 15,
          );
        },
        itemCount: popularFood.length,
      ),
    );
  }
}
