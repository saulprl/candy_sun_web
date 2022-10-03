import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../providers/products.dart';

import '../../models/product.dart';

class ProductForm extends StatefulWidget {
  final Product? item;

  const ProductForm({
    this.item,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _titleController = TextEditingController();
  final _trademarkController = TextEditingController();
  final _priceController = TextEditingController();
  final _costController = TextEditingController();
  final _quantityController = TextEditingController();
  final _caloriesController = TextEditingController();
  final _purchaseDateController = TextEditingController();
  final _expirationDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      _titleController.text = widget.item!.title;
      _trademarkController.text = widget.item!.trademark;
      _priceController.text = widget.item!.price.toStringAsFixed(2);
      _costController.text = widget.item!.cost.toStringAsFixed(2);
      _quantityController.text = widget.item!.quantity.toString();
      _caloriesController.text = widget.item!.calories.toStringAsFixed(2);
      _purchaseDateController.text =
          DateFormat('yyyy-MM-dd').format(widget.item!.dateOfPurchase);
      _expirationDateController.text =
          DateFormat('yyyy-MM-dd').format(widget.item!.expirationDate);
    }
  }

  void _saveForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (widget.item != null) {
      Provider.of<Products>(context, listen: false).editProduct(Product(
        id: widget.item!.id,
        title: _titleController.text,
        trademark: _trademarkController.text,
        price: double.parse(_priceController.text),
        cost: double.parse(_costController.text),
        quantity: int.parse(_quantityController.text),
        calories: double.parse(_caloriesController.text),
        dateOfPurchase:
            DateFormat('yyyy-MM-dd').parse(_purchaseDateController.text),
        expirationDate:
            DateFormat('yyyy-MM-dd').parse(_expirationDateController.text),
      ));
    } else {
      Provider.of<Products>(context, listen: false).addProduct(Product(
        id: const Uuid().v1(),
        title: _titleController.text,
        trademark: _trademarkController.text,
        price: double.parse(_priceController.text),
        cost: double.parse(_costController.text),
        quantity: int.parse(_quantityController.text),
        calories: double.parse(_caloriesController.text),
        dateOfPurchase:
            DateFormat('yyyy-MM-dd').parse(_purchaseDateController.text),
        expirationDate:
            DateFormat('yyyy-MM-dd').parse(_expirationDateController.text),
      ));
    }

    Navigator.of(context).pop();
  }

  Widget _buildForm(Size deviceSize, Products productsData) {
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

    return Column(
      children: [
        GridView(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxis,
            childAspectRatio: ratio,
            crossAxisSpacing: 8.0,
          ),
          children: [
            TextFormField(
              key: const ValueKey('title'),
              controller: _titleController,
              autocorrect: true,
              enableSuggestions: true,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Title can\'t be empty!';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            TextFormField(
              key: const ValueKey('trademark'),
              controller: _trademarkController,
              autocorrect: true,
              enableSuggestions: true,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Trademark',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Trademark can\'t be empty!';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            TextFormField(
              key: const ValueKey('price'),
              controller: _priceController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Price',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Price can\'t be empty!';
                }
                if (double.tryParse(value)! <= 0.0) {
                  return 'Price can\'t be less than or equal to 0.';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            TextFormField(
              key: const ValueKey('cost'),
              controller: _costController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Cost',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Cost can\'t be empty!';
                }
                if (double.tryParse(value)! <= 0.0) {
                  return 'Cost can\'t be less than or equal to 0.';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            TextFormField(
              key: const ValueKey('quantity'),
              controller: _quantityController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantity',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Quantity can\'t be empty!';
                }
                if (int.tryParse(value)! < 0) {
                  return 'Quantity can\'t be less than 0.';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            TextFormField(
              key: const ValueKey('purchaseDate'),
              controller: _purchaseDateController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Purchase date',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Date of purchase can\'t be empty!';
                }
                if (DateFormat('yyyy-MM-dd')
                    .parse(value)
                    .isAfter(DateTime.now())) {
                  return 'Date of purchase hasn\'t happened yet.';
                }
                return null;
              },
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                showDatePicker(
                  context: context,
                  initialDate: _purchaseDateController.text.isEmpty
                      ? DateTime.now()
                      : DateFormat('yyyy-MM-dd')
                          .parse(_purchaseDateController.text),
                  firstDate:
                      DateTime.now().subtract(const Duration(days: 1095)),
                  lastDate: DateTime.now(),
                ).then(
                  (dateChosen) {
                    if (dateChosen == null) {
                      return;
                    }
                    setState(() {
                      _purchaseDateController.text =
                          DateFormat('yyyy-MM-dd').format(dateChosen);
                    });
                  },
                );
              },
            ),
            TextFormField(
              key: const ValueKey('expirationDate'),
              controller: _expirationDateController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Expiration date',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Expiration date can\'t be empty!';
                }
                if (DateTime.now()
                    .isAfter(DateFormat('yyyy-MM-dd').parse(value))) {
                  return 'Expiration date has already happened.';
                }
                return null;
              },
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                showDatePicker(
                  context: context,
                  initialDate: _expirationDateController.text.isEmpty
                      ? DateTime.now()
                      : DateFormat('yyyy-MM-dd')
                          .parse(_expirationDateController.text),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 1095)),
                ).then(
                  (dateChosen) {
                    if (dateChosen == null) {
                      return;
                    }
                    setState(() {
                      _expirationDateController.text =
                          DateFormat('yyyy-MM-dd').format(dateChosen);
                    });
                  },
                );
              },
            ),
            TextFormField(
              key: const ValueKey('calories'),
              controller: _caloriesController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Calories',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Calories can\'t be empty!';
                }
                if (double.tryParse(value)! <= 0.0) {
                  return 'Calories can\'t be less than or equal to 0.';
                }
                return null;
              },
              onSaved: (value) {},
            ),
          ],
        ),
        ElevatedButton(
          onPressed: _saveForm,
          child: const Text('Save product'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final productsData = Provider.of<Products>(context, listen: false);

    return Form(
      key: _formKey,
      child: _buildForm(deviceSize, productsData),
    );
  }
}
