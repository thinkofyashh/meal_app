import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_app/Screens/category.dart';
import 'package:meal_app/Screens/meal.dart';
import 'package:meal_app/Screens/tabs.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 131, 57, 0),
        brightness: Brightness.dark),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const ProviderScope(child:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:theme,
      home: //Categories()
     // MealsScreen(meals:dummyMeals,title: 'system',)
      TabScreen(),
    );
  }
}
