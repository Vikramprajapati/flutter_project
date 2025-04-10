import 'package:flutter/material.dart';

class FoodList extends StatefulWidget {
  const FoodList({super.key});

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  final _foodController = TextEditingController();

  List<Map<String,dynamic>> foodList = [];
  String? category;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food List App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _foodController,
              decoration: InputDecoration(
                  label: Text('Food'),
                  hintText: "Enter Food Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Radio(
                    value: "veg",
                    groupValue: category,
                    onChanged: (value) {
                    setState(() {
                      category=value!;
                    });
                    },
                  ),
                  Text("VEG"),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: "non_veg",
                    groupValue: category,
                    onChanged: (value) {
                      setState(() {
                        category=value!;
                      });
                    },
                  ),
                  Text("NON-VEG"),
                ],
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  if (foodList.contains(_foodController.text.toString())) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Alredy Exit")));
                  } else {
                    foodList.add({
                      "product":_foodController.text.toString(),
                      "category":category
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Food Added successfully.")));
                  }
                  _foodController.clear();
                  category==null;

                });
              },
              child: Text("ADD")),
          SizedBox(
            height: 40,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: foodList.length,
            itemBuilder: (context, index) {
              // Color tileColor = category == "veg" ? Colors.green : Colors.red;
              return ListTile(
                tileColor: foodList[index]["category"]=="veg"?Colors.green:Colors.red,
                title: Text(foodList[index]["product"]),
              );
            },
          ))
        ],
      ),
    );
  }
}
