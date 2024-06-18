// main.dart
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'product_detail_screen.dart';
import 'cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flipkart Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
        '/cart': (context) => CartScreen(),
      },
    );
  }
}




