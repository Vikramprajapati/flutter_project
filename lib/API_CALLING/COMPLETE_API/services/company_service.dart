import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practical/API_CALLING/COMPLETE_API/model/company.dart';
import 'package:http/http.dart' as http;

class CompanyService {
  List<Company> allCompanies = [];
  String baseUrl = "https://retoolapi.dev/IlXwem/data";

  Future<List<Company>> getAllCompanies() async {
    var response = await http.get(Uri.parse(baseUrl));

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (Map<String, dynamic> i in data) {
          allCompanies.add(Company.fromJson(i));
        }

        return allCompanies;
      } else {
        throw Exception("failed to load data");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  createCompany(Company company) async {
    try {
      var response =
          await http.post(Uri.parse(baseUrl), body: company.toJson());

      if (response.statusCode == 201) {
        print("data saved successfully");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  updateCompany(Company company, int id) async {
    try {
      try {
        var response =
            await http.put(Uri.parse(baseUrl + "/$id"), body: company.toJson());

        //TODO check delete code is 201 but not  works on 201 it works on 200 so we need to use both

        if (response.statusCode == 200 || response.statusCode == 201) {
          print("Company update successfully");
        } else {
          throw Exception("failed to update a Company");
        }
      } catch (e) {
        throw Exception(e.toString());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  deleteCompany(int id) async {
    try {
      var response = await http.delete(Uri.parse(baseUrl + "/$id"));

      //TODO check delete code is 204 but not  works on 204 it works on 200 so we need to use both

      if (response.statusCode == 200 || response.statusCode == 204) {
        print("Company deleted successfully");
      } else {
        throw Exception("failed to delete a Company");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
