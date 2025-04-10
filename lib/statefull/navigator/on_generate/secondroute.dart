import 'package:flutter/material.dart';

import 'package:flutter_practical/statefull/navigator/on_generate/route/approute.dart';

import 'model/employee.dart';

class SecondRoute extends StatelessWidget {
  final _emailController = TextEditingController();

  Employee employee;

  SecondRoute(this.employee);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Second Route'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('''
            name : ${employee.name}
            age : ${employee.age}
            salary : ${employee.salary}
         
            '''),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            FilledButton(
              onPressed: () {
                String email = _emailController.text.trim();

                employee.email = email;

                Navigator.pushNamed(context, AppRoute.thirdRoute,
                    arguments: employee);
              },
              child: Text('Navigate to Third'),
            ),
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
    );
  }
}
