import 'package:flutter/material.dart';

import '../widgets/global/main_drawer.dart';
import '../widgets/employees/employee_list.dart';

class EmployeeOverviewScreen extends StatelessWidget {
  const EmployeeOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: MediaQuery.of(context).size.width >= 1024
              ? 1024
              : double.infinity,
          padding: const EdgeInsets.all(8.0),
          child: const EmployeeList(),
        ),
      ),
    );
  }
}
