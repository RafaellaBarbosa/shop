import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductList extends ChangeNotifier {
  final List<Product> _items = dummyProducts;
  final List<Product> _favoriteItems = [];

  List<Product> get items => _showFavoritesOnly ? _favoriteItems : [..._items];

  List<Product> get favoriteProducts => _favoriteItems;

  bool _showFavoritesOnly = false;

  int get itemsCount {
    return _items.length;
  }

  void toggleShowFavoritesOnly() {
    _showFavoritesOnly = true;
    notifyListeners();
  }

  void toggleShowAllProducts() {
    _showFavoritesOnly = false;
    notifyListeners();
  }

  void addProductFromData(Map<String, Object> data) {
    final newProduct = Product(
      id: Random().nextDouble().toString(),
      name: data['name'] as String,
      description: data['description'] as String,
      price: data['price'] as double,
      imageUrl: data['imageUrl'] as String,
    );
    addProduct(newProduct);
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  void clearProducts() {
    _items.clear();
    notifyListeners();
  }

  void toggleFavorite(Product product) {
    if (_favoriteItems.contains(product)) {
      _favoriteItems.remove(product);
    } else {
      _favoriteItems.add(product);
    }
    notifyListeners();
  }
}
