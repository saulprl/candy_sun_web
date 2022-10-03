import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/products.dart';

import '../../models/product.dart';

import './product_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    var crossAxis = 1;
    var ratio = 4.0;
    if (deviceSize.width >= 375 && deviceSize.width < 425) {
      ratio = 4.7;
    } else if (deviceSize.width >= 425 && deviceSize.width < 768) {
      ratio = 5.3;
    } else if (deviceSize.width >= 768 && deviceSize.width < 1024) {
      crossAxis = 2;
      ratio = 4.8;
    } else if (deviceSize.width >= 1024) {
      crossAxis = 3;
      ratio = 4.5;
    }

    return Consumer<Products>(
      builder: (ctx, productsData, ch) => GridView.builder(
        itemBuilder: (ctx, index) => ProductItem(
          productsData.items[index],
          key: ValueKey(productsData.items[index].id),
        ),
        itemCount: productsData.items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxis,
          childAspectRatio: ratio,
          mainAxisSpacing: 6.0,
          crossAxisSpacing: deviceSize.width * 0.01,
        ),
        shrinkWrap: true,
      ),
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
