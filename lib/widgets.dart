// widgets/product_item.dart
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Image.network('URL_TO_IMAGE'),
            Text(
              'Product Title',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('\$99.99'),
          ],git
        ),
      ),
    );
  }
}