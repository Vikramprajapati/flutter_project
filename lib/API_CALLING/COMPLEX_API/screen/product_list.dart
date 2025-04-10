import 'package:flutter/material.dart';
import 'package:flutter_practical/API_CALLING/COMPLEX_API/model/product_model.dart';
import 'package:flutter_practical/API_CALLING/COMPLEX_API/screen/product_detail.dart';
import 'package:flutter_practical/API_CALLING/COMPLEX_API/services/api_service.dart';


class ProductListScreen extends StatefulWidget {
  final String category;
  ProductListScreen({required this.category});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ApiService apiService = ApiService();
  late Future<List<Products>> productsFuture;

  @override
  void initState() {
    super.initState();
    productsFuture = apiService.fetchProductsByCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),
      body: FutureBuilder<List<Products>>(
        future: productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading products"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No products found"));
          }

          List<Products> products = snapshot.data!;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(products[index].thumbnail ?? ""),
                title: Text(products[index].title ?? ""),
                subtitle: Text("\$${products[index].price?.toStringAsFixed(2)}"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailScreen(product: products[index]),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
