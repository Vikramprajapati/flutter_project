import 'package:flutter/material.dart';
import 'package:flutter_practical/statefull/navigator/anonymous/Model/employee.dart';

class ThirdScreen extends StatelessWidget {

  // String name,email;
  // int age;
  // double salary;
  //
  //
  // ThirdScreen({required this.name, required this.email, required this.age, required this.salary});

  Employee emp;

  ThirdScreen({required this.emp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('''
            Name:${emp.name},
            Age:${emp.age},
            Salary:${emp.salary},
            Email:${emp.email}
            '''),

            SizedBox(height: 16,),
            FilledButton(onPressed: () {
              Navigator.pop(context);
            }, child: Text("Back"))
          ],
        ),
      ),
    );
  }
}
