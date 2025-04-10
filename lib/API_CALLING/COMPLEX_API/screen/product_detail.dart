import 'package:flutter/material.dart';
import 'package:flutter_practical/API_CALLING/COMPLEX_API/model/product_model.dart';


class ProductDetailScreen extends StatelessWidget {
  final Products product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title ?? "Product Details")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.thumbnail ?? "",
                height: 200,
              ),
            ),
            SizedBox(height: 16),
            Text(
              product.title ?? "",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              product.description ?? "",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "Price: \$${product.price?.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            SizedBox(height: 8),
            Text(
              "Rating: ⭐ ${product.rating?.toStringAsFixed(1)}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              "Stock: ${product.stock}",
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
