import 'package:flutter/material.dart';

import './employee_item.dart';

import '../../models/employee.dart';

final DUMMY_LIST = [
  Employee(
    id: 'e1',
    firstName: 'Pedro',
    lastName: 'López',
    position: 'Vendedor',
    dob: DateTime.utc(1995, 2, 3),
    hireDate: DateTime.utc(2021, 10, 5),
    picture: '',
  ),
  Employee(
    id: 'e2',
    firstName: 'Edson',
    lastName: 'López',
    position: 'Vendedor',
    dob: DateTime.utc(1998, 2, 3),
    hireDate: DateTime.utc(2020, 10, 5),
    picture: '',
  ),
  Employee(
    id: 'e3',
    firstName: 'Luis',
    lastName: 'López',
    position: 'Vendedor',
    dob: DateTime.utc(2001, 2, 3),
    hireDate: DateTime.utc(2022, 10, 5),
    picture: '',
  ),
  Employee(
    id: 'e4',
    firstName: 'José',
    lastName: 'Ramírez',
    position: 'Vendedor',
    dob: DateTime.utc(1992, 2, 3),
    hireDate: DateTime.utc(2018, 10, 5),
    picture: '',
  ),
  Employee(
    id: 'e5',
    firstName: 'Carlos',
    lastName: 'Martínez',
    position: 'Vendedor',
    dob: DateTime.utc(1997, 2, 3),
    hireDate: DateTime.utc(2021, 10, 5),
    picture: '',
  ),
];

class EmployeeList extends StatelessWidget {
  const EmployeeList({Key? key}) : super(key: key);

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

    return GridView.builder(
      itemBuilder: (ctx, index) => EmployeeItem(
        DUMMY_LIST[index],
        key: ValueKey(DUMMY_LIST[index].id),
      ),
      itemCount: DUMMY_LIST.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxis,
        childAspectRatio: ratio,
      ),
      shrinkWrap: true,
    );
  }
}
