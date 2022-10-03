import 'package:flutter/material.dart';

import '../widgets/products/product_form.dart';

import '../models/product.dart';

class ProductFormScreen extends StatelessWidget {
  final Product? item;

  const ProductFormScreen({this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductForm(item: item),
        ),
      ),
    );
  }
}
