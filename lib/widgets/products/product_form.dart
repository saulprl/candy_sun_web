import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/product.dart';

class ProductForm extends StatefulWidget {
  final Product? item;
  final bool vertical;

  const ProductForm({
    this.item,
    required this.vertical,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _purchaseDateController = TextEditingController();
  final _expirationDateController = TextEditingController();

  Widget _buildForm(Size deviceSize) {
    if (deviceSize.width <= 425.0) {
      return Column(
        children: [
          TextFormField(
            key: const ValueKey('title'),
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
                firstDate: DateTime.now().subtract(const Duration(days: 1095)),
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
              if (DateFormat('yyyy-MM-dd')
                  .parse(value)
                  .isAfter(DateTime.now())) {
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
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Save product'),
          )
        ],
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: _buildForm(deviceSize),
    );
  }
}
