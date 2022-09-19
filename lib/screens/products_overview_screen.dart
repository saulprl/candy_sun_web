import 'package:flutter/material.dart';

import '../widgets/global/main_drawer.dart';

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
