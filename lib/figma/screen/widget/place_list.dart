import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            height: 390,
            width: 270,
            decoration: BoxDecoration(),
            //  color: Colors.red,
            child: Stack(
              children: [
                Image.asset("assets/figma_image/p1.png"),
                Positioned(
                  top: 15,
                  right: 35,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                    child: Icon(
                      Icons.favorite_outline,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 35, bottom: 25),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5)
                      ),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Column(

                        children: [
                          Row(
                            children: [
                              Text(
                                "Mount Fuji, ",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              Text(
                                "Tokyo",
                                style: TextStyle(
                                    color: Colors.grey.shade200, fontSize: 18),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(

                            children: [Icon(Icons.location_on_outlined,color: Colors.white,size: 25,)
                              ,
                              Text(
                                "Tokyo, Japan",
                                style: TextStyle(
                                    color: Colors.grey.shade200, fontSize: 16),
                              ),
                              SizedBox(width: 10,),
                              Row(
                                children: [
                                  Icon(Icons.star_border_sharp,color: Colors.white,),
                                  Text("4.8",style: TextStyle(color: Colors.white),)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ).asGlass(),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 390,
            width: 270,
            decoration: BoxDecoration(),
            //  color: Colors.red,
            child: Stack(
              children: [
                Image.asset("assets/figma_image/p2.png"),
                Positioned(
                  top: 15,
                  right: 25,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                    child: Icon(
                      Icons.favorite_outline,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 35, bottom: 25),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5)
                      ),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: Column(

                        children: [
                          Row(
                            children: [
                              Text(
                                "Andes Mountain ",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),

                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [Icon(Icons.location_on_outlined,color: Colors.white,size: 25,)
                              ,
                              Text(
                                "America",
                                style: TextStyle(
                                    color: Colors.grey.shade200, fontSize: 16),
                              ),
                              SizedBox(width: 10,),
                              Row(
                                children: [
                                  Icon(Icons.star_border_sharp,color: Colors.white,),
                                  Text("4.8",style: TextStyle(color: Colors.white),)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ).asGlass(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
