import 'package:flutter/material.dart';

import '../../models/product.dart';

import '../../screens/product_details_screen.dart';

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
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ProductDetailsScreen(widget.item),
            ),
          ),
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
                trailing: PopupMenuButton(
                  icon: const Icon(Icons.more_horiz),
                  itemBuilder: (ctx) => [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Row(
                        children: const [
                          Icon(Icons.edit, color: Colors.amber),
                          SizedBox(width: 8.0),
                          Text('Editar'),
                        ],
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            color: Theme.of(ctx).colorScheme.error,
                          ),
                          const SizedBox(width: 8.0),
                          const Text('Eliminar'),
                        ],
                      ),
                    )
                  ],
                  onSelected: (value) {
                    switch (value) {
                      case 0:
                        break;
                      case 1:
                        showDialog<bool>(
                          context: context,
                          barrierDismissible: false,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Eliminar producto'),
                            content: const Text(
                                '¿Deseas eliminar este producto? No podrás recuperarlo.'),
                            actions: [
                              TextButton(
                                child: Text(
                                  'Cancelar',
                                  style: TextStyle(
                                    color: Theme.of(ctx).colorScheme.secondary,
                                  ),
                                ),
                                onPressed: () => Navigator.of(ctx).pop(false),
                              ),
                              TextButton(
                                child: Text(
                                  'Eliminar',
                                  style: TextStyle(
                                    color: Theme.of(ctx).colorScheme.error,
                                  ),
                                ),
                                onPressed: () => Navigator.of(ctx).pop(true),
                              ),
                            ],
                          ),
                        );
                        break;
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
