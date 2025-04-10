import 'dart:convert';
import 'package:flutter_practical/API_CALLING/GET_API_WITH_MODEL_AND_SERVICEFOLDER/model/users_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String uri = "https://jsonplaceholder.typicode.com/posts";

  List<Users> users = [];

  getUsers() async {
    var response = await http.get(Uri.parse(uri));
    var data = jsonDecode(response.body);

    try {
      if (response.statusCode == 200) {
        for (Map<String, dynamic> i in data) {
          users.add(Users.fromJson(i));
        }
        return users;
      } else {
        throw Exception("failed to load data");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
