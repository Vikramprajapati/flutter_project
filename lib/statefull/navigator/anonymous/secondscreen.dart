import 'package:flutter/material.dart';
import 'package:flutter_practical/statefull/navigator/anonymous/Model/employee.dart';
import 'package:flutter_practical/statefull/navigator/anonymous/thirdscreen.dart';

class SecondScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  // String name;
  // int age;
  // double salary;
  // Employee emp;

 // SecondScreen({required this.name, required this.age, required this.salary});

 Employee emp;


  SecondScreen({required this.emp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('''
            Name:${emp.name},
              Age:${emp.age},
              Salary:${emp.salary}
              '''),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Enter Name",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                child: FilledButton(onPressed: () {
                  String email=_emailController.text.trim();

                  emp.email=email;

                  Navigator.push(context, MaterialPageRoute(builder: (context) => ThirdScreen(
                    emp: emp,
                    // name:name,
                    // age:age,
                    // salary:salary,
                    // email:email

                  ),));
                }, child: Text("Next")),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: FilledButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Back")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
