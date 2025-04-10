import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pop-Up Menu"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            PopupMenuButton(
              // popup menu click event
              onSelected: (value) {
                switch (value) {
                  case "profile":
                    _showToast("Profile Clicked");
                    break;

                  case "settings":
                    _showToast("Setting Clicked");
                    break;

                  case "others":
                    _showToast("Others Clicked");
                    break;

                  case "logout":
                    _showToast("Log Out Clicked");
                    break;
                }
              },

              itemBuilder: (context) => [
                PopupMenuItem(
                    value: "profile",
                    child: ListTile(
                      title: Text("Profile"),
                      leading: Icon(Icons.person),
                    )),
                PopupMenuItem(
                    value: "settings",
                    child: ListTile(
                      title: Text("Settings"),
                      leading: Icon(Icons.settings),
                    )),
                PopupMenuItem(
                    value: "others",
                    child: ListTile(
                      title: Text("Others"),
                      leading: Icon(Icons.other_houses),
                    )),
                PopupMenuItem(
                    value: "logout",
                    child: ListTile(
                      title: Text("Log Out"),
                      leading: Icon(Icons.logout),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

void _showToast(String s) {
  Fluttertoast.showToast(
      msg: s,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      textColor: Colors.black);
}
