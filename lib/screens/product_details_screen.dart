import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product item;

  const ProductDetailsScreen(this.item, {Key? key}) : super(key: key);

  Widget _buildItemInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        const Divider(),
        Text('Price: \$${item.price} | Cost: \$${item.cost}'),
        // const Divider(),
        Text(
          'Expiration date: ${DateFormat.yMMMd().format(item.expirationDate)}',
        ),
        // const Divider(),
        Text('Calories: ${item.calories}'),
        // const Divider(),
        Text('Quantity: ${item.quantity}'),
      ],
    );
  }

  Widget _buildHorizontalCard(Size deviceSize) {
    var containerHeight = deviceSize.height * 0.7;

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 608 * 0.7,
          maxWidth: 768,
        ),
        height: containerHeight,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(12.0),
                ),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/img/No_Image.jpg'),
                  image: AssetImage(item.image),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: _buildItemInfo(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerticalCard(Size deviceSize) {
    return SizedBox(
      width: deviceSize.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxHeight: deviceSize.height * 0.4,
                ),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12.0),
                    ),
                    child: FadeInImage(
                      placeholder: const AssetImage('assets/img/No_Image.jpg'),
                      image: AssetImage(item.image),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildItemInfo(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    var containerWidth = double.infinity;
    if (deviceSize.width > 425 && deviceSize.width < 768) {
      containerWidth = deviceSize.width * 0.5;
    } else if (deviceSize.width >= 768) {
      containerWidth = deviceSize.width * 0.4;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: deviceSize.width >= 768
          ? _buildHorizontalCard(deviceSize)
          : _buildVerticalCard(deviceSize),
    );
  }
}