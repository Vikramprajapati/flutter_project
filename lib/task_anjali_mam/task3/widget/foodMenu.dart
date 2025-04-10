import 'package:flutter/material.dart';
import 'package:flutter_practical/task_anjali_mam/task3/screen/detail_screen.dart';

class Foodmenu extends StatelessWidget {
  Foodmenu({super.key});

  List<Map<String, dynamic>> fooddetail = [
    {
      'title': "Mexican",
      'subTitle': 'potatoes',
      'time': '45 MIN',
      'rate': 4.63,
      'extra': 232,
      'image': "assets/images/plate1.png",

    },
    {
      'title': "Fettuccine",
      'subTitle': 'al dante',
      'time': '45 MIN',
      'rate': 5.93,
      'extra': 521,
      'image': "assets/images/plate2.png",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        foodDetail: fooddetail[index],
                      ),
                    ));
              },
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 24.0, top: 24, right: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fooddetail[index]['title'],
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(fooddetail[index]['subTitle'],
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(fooddetail[index]['title'] == "Mexican"
                                  ? "👌"
                                  : "🔥"),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${fooddetail[index]['rate']}(${fooddetail[index]['extra']})",
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 30,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Colors.yellow[200],
                                borderRadius: BorderRadius.circular(10)),
                            child:
                                Center(child: Text(fooddetail[index]['time'])),
                          )
                        ],
                      ),
                      Container(
                          height: 150,
                          width: 150,
                          child: Image.asset(fooddetail[index]['image']))
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: fooddetail.length);
  }
}
