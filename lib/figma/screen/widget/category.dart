import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  List<String> category = ["Most Viewed", "Nearby", "Latest"];

  final int selected;
  Function callback;

  Category({required this.selected, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,

      padding: EdgeInsets.symmetric(vertical: 30),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: ()=>callback(index),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: selected==index?Colors.black:Colors.white
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),

                child: Text(category[index],style: TextStyle(color: selected==index?Colors.white:Colors.grey.shade400,fontWeight: FontWeight.bold),),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 60,
            );
          },
          itemCount: category.length)
    );
  }
}
