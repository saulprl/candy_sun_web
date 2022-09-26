import 'package:flutter/material.dart';

import '../../models/employee.dart';

class EmployeeItem extends StatelessWidget {
  final Employee employee;

  const EmployeeItem(this.employee, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(
                  '${employee.firstName} ${employee.lastName}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(employee.position),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: const Icon(Icons.person),
                  // FadeInImage(
                  //   placeholder: const AssetImage('assets/img/No_Image.jpg'),
                  //   image: AssetImage(employee.picture),
                  //   fit: BoxFit.cover,
                  // ),
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
                            title: const Text('Eliminar empleado'),
                            content: const Text(
                                '¿Deseas eliminar el registro de este empleado? No podrás recuperarlo.'),
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
