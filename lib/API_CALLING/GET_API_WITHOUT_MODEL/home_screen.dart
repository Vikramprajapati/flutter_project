import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as htttp;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];

  // bool isLoading = true;

  String uri = "https://jsonplaceholder.typicode.com/posts";

  getUsers() async {
    try {
      var response = await htttp.get(Uri.parse(uri));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        setState(() {
          users = data;
          //  isLoading = false;
        });
      } else {
        throw Exception("failed to load data");
      }
    } catch (e) {
      throw Exception(e.toString());
      //  isLoading = false;
    }
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getUsers();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GET API CALLING WITHOUT MODEL'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            FutureBuilder(
              future: getUsers(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return Expanded(
                    child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(users[index]["id"].toString()),
                          SizedBox(
                            height: 20,
                          ),
                          Text(users[index]["userId"].toString())
                        ],
                      ),
                    );
                  },
                ));
              },
            )
          ],
        ));
  }
}
