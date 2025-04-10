import 'package:flutter/material.dart';
import 'package:flutter_practical/bottome_navigation/screen/home_screen.dart';
import 'package:flutter_practical/bottome_navigation/screen/profile_screen.dart';
import 'package:flutter_practical/bottome_navigation/screen/settings_screen.dart';


class DashboardScreen extends StatefulWidget {
   DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int? selectedIndex=1;
  List<Widget> currentScreen=[HomeScreen(),SettingsScreen(),ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation App Bar'),
      ),
      body: Center(
        child:currentScreen[selectedIndex!]
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[150],
          currentIndex: selectedIndex!,
      selectedItemColor: Colors.black,

      onTap: (value) {
        setState(() {
          selectedIndex=value;
        });
      },

      items: [
        BottomNavigationBarItem(icon:Icon(Icons.home),label: "home"),
        BottomNavigationBarItem(icon:Icon(Icons.settings),label: "settings"),
        BottomNavigationBarItem(icon:Icon(Icons.person),label: "Profile"),
      ]),
    );
  }
}
