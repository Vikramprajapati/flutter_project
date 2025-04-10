import 'package:flutter/material.dart';
import 'package:flutter_practical/statefull/navigator/named/model/employee.dart';


class FirstPage extends StatelessWidget {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
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

                    Employee emp =
                    Employee(name: name, age: age, salary: salary);

                    // navigate to second page
                    Navigator.pushNamed(context, '/second', arguments: emp);
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
