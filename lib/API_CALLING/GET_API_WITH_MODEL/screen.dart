import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practical/API_CALLING/GET_API_WITH_MODEL/model/UserModel.dart';

import 'package:http/http.dart ' as http;

class Screen extends StatefulWidget {
  Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  String uri = "https://jsonplaceholder.typicode.com/posts";

  List<Users> users = [];

  getUser() async {
    try{
      var response = await http.get(Uri.parse(uri));
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        for (Map<String, dynamic> i in data) {
          users.add(Users.fromJson(i));
        }
        
        return users;
      }
    }
    catch(e)
    {
      throw Exception(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text("${index + 1}"),
                          ),
                          title: Text(users[index].title.toString()),
                          subtitle: Text(users[index].body.toString()),
                        ),
                      );
                    },
                  );
                } else {
                 return Center(
                   child: Text("No Data Found"),
                 );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
