import 'package:flutter/material.dart';

import 'package:flutter_practical/statefull/navigator/on_generate/route/approute.dart';

import 'model/employee.dart';

class FirstRoute extends StatelessWidget {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    //errorText: _errFname,
                  ),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _ageController,
                  decoration: InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(),
                    //errorText: _errFname,
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _salaryController,
                  decoration: InputDecoration(
                    labelText: 'Salary',
                    border: OutlineInputBorder(),
                    //errorText: _errFname,
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 16,
                ),
                FilledButton(
                  onPressed: () {
                    String name = _nameController.text.trim();
                    int age = _ageController.text.trim().isEmpty
                        ? 0
                        : int.parse(_ageController.text.trim());
                    double salary = _salaryController.text.trim().isEmpty
                        ? 0.0
                        : double.parse(_salaryController.text.trim());

                    Employee employee =
                    Employee(name: name, age: age, salary: salary);

                    Navigator.pushNamed(context, AppRoute.secondRoute,
                        arguments: employee);
                  },
                  child: Text('Navigate to Second'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
