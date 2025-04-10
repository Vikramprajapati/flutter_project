import 'package:flutter/material.dart';


import 'model/employee.dart';

class ThirdRoute extends StatefulWidget {
  Employee employee;

  ThirdRoute(this.employee);

  @override
  State<ThirdRoute> createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Third Route'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('''
            name : ${widget.employee.name}
            age : ${widget.employee.age}
            salary : ${widget.employee.salary}
            email : ${widget.employee.email}
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
