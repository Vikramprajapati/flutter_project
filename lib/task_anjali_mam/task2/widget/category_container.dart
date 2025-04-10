import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  Function callback;
  int selected;

  CategoryContainer({required this.callback, required this.selected});

  List<String> category = [
    "Rice Bowl",
    "Biryani",
    "Pizza",
    "Bakery & Cake",
    "Pasta"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      //  color: Colors.blue,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                callback(index);
              },
              child: Container(
                child: Column(
                  children: [
                    Text(
                      category[index],
                      style: TextStyle(
                          color: selected == index ? Colors.black : Colors.grey,
                          fontSize: 14),
                    ),
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: selected == index ? Colors.red : Colors.white,
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 15,
            );
          },
          itemCount: category.length),
    );
  }
}
