import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> languages=["Dart","C","C++","Python","Java"];
  late String _selectlanguage;
  @override

  void initState()
  {
    _selectlanguage=languages.first;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("DropDown"),
          centerTitle: true,
        ),
        body: Center(
          child: DropdownButton(
            value: _selectlanguage,
            icon: Icon(Icons.arrow_downward),
              items: List.generate(languages.length,
                      (index) => DropdownMenuItem(child: Text("${languages[index]}"),
                      value: languages[index],)).toList(),
              onChanged: (value) {
              setState(() {
                _selectlanguage=value!;
              });

              },),
        ),
      ),
    );
  }
}
