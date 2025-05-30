import 'package:flutter/material.dart';

class Product extends ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  @override
  String toString() {
    return 'Product{id: $id, name: $name, description: $description, price: $price, imageUrl: $imageUrl, isFavorite: $isFavorite}';
  }
}
