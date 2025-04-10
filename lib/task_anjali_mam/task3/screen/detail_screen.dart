import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailScreen extends StatelessWidget {
  Map foodDetail;

  DetailScreen({required this.foodDetail});

  List<String> ingredient_image = [
    "assets/images/i1.png",
    "assets/images/i2.png",
    "assets/images/i3.png",
    "assets/images/i4.png",
  ];
  List<String> ingredient_name = ["Potato", "Beans", "Tomato", "Meat"];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.1),
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  Text(
                    "${foodDetail['title']} ${foodDetail['subTitle']} ",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Icon(
                    Icons.sort,
                    color: Colors.white,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "🔥 ${foodDetail['rate']}(${foodDetail['extra']})",
                style: TextStyle(color: Colors.white.withOpacity(0.8)),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 250,
                //color: Colors.grey,
                child: Image.asset(
                  foodDetail['image'],
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(40)),
                  child: Column(
                    children: [
                      Icon(
                        Icons.horizontal_rule,
                        color: Colors.white.withOpacity(0.4),
                        size: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0, right: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recipe",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.yellow[200],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(child: Text(foodDetail['time'])),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle_outlined,
                              color: Colors.yellow[100],
                              size: 20,
                            ),
                            Text(
                              "    Step 1",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(40)),
                          child: Column(
                            children: [
                              Icon(
                                Icons.horizontal_rule,
                                color: Colors.white.withOpacity(0.4),
                                size: 40,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 24.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Ingredients Ingredients",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 90,
                                //color: Colors.red,

                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24.0, right: 24),
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        width: 70,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.white.withOpacity(0.1)),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Image.asset(
                                                  ingredient_image[index],width: 40,height: 40,),
                                              Text(ingredient_name[index],style: TextStyle(color: Colors.white.withOpacity(0.5)),)
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        width: 15,
                                      );
                                    },
                                    itemCount: 4,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Text("Show More",style: TextStyle(color: Colors.white),),
                              Icon(Icons.keyboard_arrow_down_sharp,color: Colors.white,)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
