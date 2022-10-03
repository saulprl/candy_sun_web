import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/theme_preferences.dart';
import './providers/products.dart';

import './screens/products_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var darkScheme = ColorScheme.dark(
      primary: Colors.pink[400]!,
      secondary: Colors.purple[300]!,
      background: Colors.grey[900]!,
      onPrimary: Colors.white,
      surface: Colors.grey[800]!,
      surfaceVariant: Colors.black,
      onBackground: Colors.white,
      error: Colors.red,
    );
    var lightScheme = ColorScheme.light(
      primary: Colors.pink[400]!,
      secondary: Colors.deepPurple,
      background: Colors.white,
      onPrimary: Colors.white,
      surface: Colors.grey[200]!,
      surfaceVariant: Colors.grey[300],
      onBackground: Colors.grey[800]!,
      error: Colors.red,
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ThemePreferences(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        )
      ],
      child: Consumer<ThemePreferences>(
        builder: (ctx, themeProvider, ch) => MaterialApp(
          title: 'Candy Sun',
          theme: ThemeData(
            scaffoldBackgroundColor: themeProvider.isDark
                ? darkScheme.background
                : lightScheme.background,
            colorScheme: themeProvider.isDark ? darkScheme : lightScheme,
            appBarTheme: AppBarTheme(
              elevation: 3.0,
              backgroundColor: Colors.pink[400]!,
            ),
            shadowColor:
                themeProvider.isDark ? Colors.grey[900]! : Colors.grey[600]!,
          ),
          home: const ProductsOverviewScreen(),
        ),
      ),
    );

    // return MaterialApp(
    //   title: 'Candy Sun Web',
    //   theme: ThemeData(
    //     colorScheme: ColorScheme.fromSwatch().copyWith(
    //       primary: Colors.pink,
    //       secondary: Colors.purple,
    //     ),
    //   ),
    //   home: const ProductsOverviewScreen(),
    // );
  }
}
