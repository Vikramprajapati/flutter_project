import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practical/statefull/navigator/anonymous/Model/employee.dart';
import 'package:flutter_practical/statefull/navigator/anonymous/secondscreen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Enter Name",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.name,
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                labelText: "Enter age",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: _salaryController,
              decoration: InputDecoration(
                labelText: "Enter Salary",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              child: FilledButton(
                  onPressed: () {
                    String name = _nameController.text.trim();
                    int age = _ageController.text.trim().isEmpty
                        ? 0
                        : int.parse(_ageController.text.trim());
                    double salary = _salaryController.text.trim().isEmpty
                        ? 0
                        : double.parse(_salaryController.text.trim());

                    Employee emp =
                        Employee(name: name, age: age, salary: salary);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondScreen(
                            emp: emp,

                            // name: name!,
                            // age: age,
                            // salary: salary,
                          ),
                        ));
                  },
                  child: Text("Next")),
            )
          ],
        ),
      ),
    );
  }
}
