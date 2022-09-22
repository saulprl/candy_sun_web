import 'package:flutter/material.dart';

import '../widgets/products/product_form.dart';

class ProductFormScreen extends StatelessWidget {
  const ProductFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a product'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ProductForm(vertical: true),
        ),
      ),
    );
  }
}
