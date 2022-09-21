import 'package:flutter/material.dart';

import '../../models/product.dart';

class ProductItem extends StatefulWidget {
  final Product item;

  const ProductItem(this.item, {Key? key}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      // margin: const EdgeInsets.all(12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      // return ClipRRect(
      //   borderRadius: BorderRadius.circular(12.0),
      // child: GridTile(
      //   header: GridTileBar(
      //     backgroundColor: Colors.black54,
      //     title: Text(
      //       widget.item.title,
      //       textAlign: TextAlign.center,
      //     ),
      //   ),
      //   child: GestureDetector(
      //     onTap: () {},
      //     child: Hero(
      //       tag: widget.item.id,
      //       child: FadeInImage(
      //         placeholder: const AssetImage(
      //           'assets/img/No_Image.jpg',
      //         ),
      //         image: AssetImage(widget.item.image),
      //         fit: BoxFit.cover,
      //       ),
      //     ),
      //   ),
      // ),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(12.0),
              //   child: FadeInImage(
              //     placeholder: const AssetImage('assets/img/No_Image.jpg'),
              //     image: AssetImage(widget.item.image),
              //     fit: BoxFit.fitWidth,
              //   ),
              // ),
              ListTile(
                title: Text(
                  widget.item.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('\$${widget.item.price}'),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/img/No_Image.jpg'),
                    image: AssetImage(widget.item.image),
                    fit: BoxFit.cover,
                  ),
                ),
                // trailing: IconButton(
                //   icon: const Icon(Icons.expand_more),
                //   onPressed: () {},
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
