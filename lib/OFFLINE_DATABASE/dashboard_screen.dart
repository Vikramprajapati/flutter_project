import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String? studentName = "", subject = "";

  Future<void> getData() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
   setState(() {
     studentName = _pref.getString("name");
     subject = _pref.getString("subject");
   });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Record"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Name: ${studentName}"),
            Text("Subject:${subject}"),
          ],
        ),
      ),
    );
  }
}
