import 'package:flutter/material.dart';
import 'package:flutter_practical/statefull/navigator/named/model/employee.dart';


class SecondPage extends StatelessWidget {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var name = ModalRoute.of(context)!.settings.name ?? '';

    var employee = ModalRoute.of(context)!.settings.arguments as Employee;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Second Page'),
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
            name route : ${name}
            '''),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
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

                Navigator.pushNamed(context, '/third', arguments: employee);
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
