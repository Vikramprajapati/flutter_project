import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text = '';

  final _msgController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextField'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            /*border: OutlineInputBorder(),*/
                            filled: true,
                            fillColor: Colors.grey.shade200,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            /*border: OutlineInputBorder(),*/
                            filled: true,
                            fillColor: Colors.grey.shade200,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      labelText: 'Enter Name',
                      /*border: OutlineInputBorder(),*/
                      filled: true,
                      fillColor: Colors.grey.shade200,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextField(
                    controller: _msgController,
                    onChanged: (value) {
                      print('$value');
                      setState(() {
                        text = value.split('').reversed.join('');
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Message',
                      labelText: 'Enter Message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  FilledButton.tonal(
                    onPressed: () {
                      String msg = _msgController.text.trim();

                      setState(() {
                        text = msg.split('').reversed.join('');
                      });

                      // print(msg);
                    },
                    child: Text('REVERSE'),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    '$text',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
