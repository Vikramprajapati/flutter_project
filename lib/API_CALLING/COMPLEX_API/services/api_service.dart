import 'dart:convert';
import 'package:flutter_practical/API_CALLING/COMPLEX_API/model/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://dummyjson.com/products";

  // Fetch all products
  Future<List<Products>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      ProductListModel productList = ProductListModel.fromJson(jsonData);
      return productList.products ?? [];
    } else {
      throw Exception("Failed to load products");
    }
  }

  // Fetch unique categories from products
  Future<List<String>> fetchCategories() async {
    List<Products> products = await fetchProducts();
    List<String> categories = products.map((e) => e.category!).toSet().toList();
    return categories;
  }

  // Fetch products by category
  Future<List<Products>> fetchProductsByCategory(String category) async {
    List<Products> products = await fetchProducts();
    return products.where((product) => product.category == category).toList();
  }
}
