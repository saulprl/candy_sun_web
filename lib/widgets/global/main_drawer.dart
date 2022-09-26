import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_preferences.dart';

import '../../screens/employee_overview_screen.dart';
import '../../screens/products_overview_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _buildListTile(
    BuildContext ctx,
    String title,
    IconData icon,
    VoidCallback tapHandler,
  ) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            size: 26.0,
            color: Theme.of(ctx).colorScheme.secondary,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: tapHandler,
        ),
        const Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemePreferences>(
      builder: (ctx, themeNotifier, ch) => Drawer(
        child: Column(
          children: [
            AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              title: const Text(
                'Candy Sun',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    themeNotifier.isDark ? Icons.light_mode : Icons.dark_mode,
                  ),
                  onPressed: () => themeNotifier.isDark = !themeNotifier.isDark,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            _buildListTile(
              context,
              'Products',
              Icons.category,
              () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => const ProductsOverviewScreen(),
                ),
              ),
            ),
            _buildListTile(
              context,
              'Sales',
              Icons.attach_money,
              () {},
            ),
            _buildListTile(
              context,
              'Employees',
              Icons.person,
              () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => const EmployeeOverviewScreen(),
                ),
              ),
            ),
            _buildListTile(
              context,
              'Log out',
              Icons.logout,
              () {},
            ),
          ],
        ),
      ),
    );
  }
}
