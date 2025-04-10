import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  Category({super.key});

  List<String> category = ["Main dishes", "Deserts", "Meat"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      //  width: double.infinity,
      // decoration: BoxDecoration(color: Colors.red),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(category[index],style: TextStyle(color: Colors.white,fontSize: 15),),)
              ),
            );
          },
          itemCount: category.length),
    );
  }
}
