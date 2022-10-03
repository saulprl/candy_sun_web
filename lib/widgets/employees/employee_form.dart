import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/employee.dart';

class EmployeeForm extends StatefulWidget {
  final Employee? item;
  final bool vertical;

  const EmployeeForm({
    this.item,
    required this.vertical,
    Key? key,
  }) : super(key: key);

  @override
  State<EmployeeForm> createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  Widget _buildForm(Size deviceSize) {
    if (deviceSize.width <= 425) {
      return Column(children: [
        TextFormField(
          key: const ValueKey('First name'),
          autocorrect: false,
          enableSuggestions: false,
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            labelText: 'First name',
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'First name can\'t be empty!';
            }
            return null;
          },
          onSaved: (value) {},
        ),
      ]);
    } else {
      return Column();
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
