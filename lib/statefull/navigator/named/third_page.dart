import 'package:flutter/material.dart';
import 'package:flutter_practical/statefull/navigator/named/model/employee.dart';



class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var name = ModalRoute.of(context)!.settings.name ?? '';
    var employee = ModalRoute.of(context)!.settings.arguments as Employee;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Third Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('''
            name : ${employee.name}
            age : ${employee.age}
            salary : ${employee.salary}
            email : ${employee.email}
            name route : ${name}
            '''),
              SizedBox(
                height: 16,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go Back'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
