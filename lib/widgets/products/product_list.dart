import 'package:flutter/material.dart';

import '../../models/product.dart';

import './product_item.dart';

final DUMMY_LIST = [
  Product(
    id: 'p1',
    title: 'Title 1',
    price: 1.99,
    cost: 2.49,
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
    price: 1.99,
    cost: 2.49,
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
    price: 1.99,
    cost: 2.49,
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
    price: 1.99,
    cost: 2.49,
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
    price: 1.99,
    cost: 2.49,
    dateOfPurchase: DateTime.utc(2022),
    quantity: 30,
    calories: 150.0,
    trademark: 'Trademark 3',
    expirationDate: DateTime.utc(2023),
    image: 'assets/img/No_Image.jpg',
  ),
];

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    var crossAxis = 1;
    var aspectRatio = 4.0;
    if (deviceSize.width > 375 && deviceSize.width < 768) {
      crossAxis = 2;
      aspectRatio = 2.6;
    } else if (deviceSize.width >= 768) {
      crossAxis = 3;
      aspectRatio = 3.2;
    }

    return GridView.builder(
      itemBuilder: (ctx, index) => ProductItem(
        DUMMY_LIST[index],
        key: ValueKey(DUMMY_LIST[index].id),
      ),
      itemCount: DUMMY_LIST.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxis,
        childAspectRatio: aspectRatio,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: deviceSize.width * 0.01,
      ),
    );
  }
}
