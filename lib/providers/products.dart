import 'package:flutter/material.dart';

import '../models/product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Title 1',
      price: 2.49,
      cost: 1.99,
      dateOfPurchase: DateTime.utc(2022),
      quantity: 30,
      calories: 150.0,
      trademark: 'Trademark 1',
      expirationDate: DateTime.utc(2023),
      image: 'assets/img/No_Image.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Title 2',
      price: 2.49,
      cost: 1.99,
      dateOfPurchase: DateTime.utc(2022),
      quantity: 30,
      calories: 150.0,
      trademark: 'Trademark 2',
      expirationDate: DateTime.utc(2023),
      image: 'assets/img/No_Image.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Title 3',
      price: 2.49,
      cost: 1.99,
      dateOfPurchase: DateTime.utc(2022),
      quantity: 30,
      calories: 150.0,
      trademark: 'Trademark 1',
      expirationDate: DateTime.utc(2023),
      image: 'assets/img/No_Image.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Title 4',
      price: 2.49,
      cost: 1.99,
      dateOfPurchase: DateTime.utc(2022),
      quantity: 30,
      calories: 150.0,
      trademark: 'Trademark 2',
      expirationDate: DateTime.utc(2023),
      image: 'assets/img/No_Image.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Title 5',
      price: 2.49,
      cost: 1.99,
      dateOfPurchase: DateTime.utc(2022),
      quantity: 30,
      calories: 150.0,
      trademark: 'Trademark 3',
      expirationDate: DateTime.utc(2023),
      image: 'assets/img/No_Image.jpg',
    ),
  ];

  List<Product> get items => [..._items];

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void editProduct(Product product) {
    final existingIndex = _items.indexWhere((p) => p.id == product.id);
    _items[existingIndex] = product;
    notifyListeners();
  }

  void deleteProduct(String id) {
    _items.removeWhere((p) => p.id == id);
    notifyListeners();
  }
}
