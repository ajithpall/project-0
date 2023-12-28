import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String category;
  final String imageUrl;

  Product(
      {required this.name,
      required this.price,
      required this.category,
      required this.imageUrl});
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
        name: 'Carrot',
        price: 1.99,
        category: 'Vegetables',
        imageUrl: 'assets/carrot.jpg'),
    Product(
        name: 'Laptop',
        price: 799.99,
        category: 'Electronics',
        imageUrl: 'assets/laptop.jpg'),
    Product(
        name: 'Tomato',
        price: 0.99,
        category: 'Vegetables',
        imageUrl: 'assets/tomato.jpg'),
    // Add more products with different categories and images
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailsScreen(product: products[index]),
                ),
              );
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    products[index].imageUrl,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products[index].name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$${products[index].price.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 14, color: Colors.blue),
                        ),
                        Text(
                          products[index].category,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
            SizedBox(height: 10),
            Text(
              'Category: ${product.category}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Product description goes here...',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
