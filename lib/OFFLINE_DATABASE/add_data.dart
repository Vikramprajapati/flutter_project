import 'package:flutter/material.dart';
import 'package:flutter_practical/OFFLINE_DATABASE/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddData extends StatelessWidget {
  AddData({super.key});

  TextEditingController _nameController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();

  Future<void> saveData() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    await _pref.setString("name", _nameController.text.toString());
    await _pref.setString("subject", _subjectController.text.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    label: Text("Name"),
                    hintText: "Enter name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _subjectController,
                decoration: InputDecoration(
                    label: Text("Subject"),
                    hintText: "Enter Subject",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    saveData();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardScreen(),
                        ));
                  },
                  child: Text("Save Student")),
              SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardScreen(),
                        ));
                  },
                  child: Text("Show Record"))
            ],
          ),
        ),
      ),
    );
  }
}
