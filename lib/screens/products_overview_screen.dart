import 'package:flutter/material.dart';

import './product_form_screen.dart';

import '../widgets/global/main_drawer.dart';
import '../widgets/products/product_list.dart';

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const ProductFormScreen(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: ProductList(),
      ),
    );
  }
}
