import 'package:flutter/material.dart';
import 'package:receitas_app/components/side_bar_page.dart';
import 'package:receitas_app/screens/categories_meals_screen.dart';

import 'package:receitas_app/screens/meal_detail_screen.dart';
import 'package:receitas_app/screens/tabs_screen.dart';
import 'package:receitas_app/utils/app_routes.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Raleway',
        canvasColor: Colors.pink[50],
        textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
              fontSize: 22,
              fontFamily: 'RobotoCondensed',
            )),
      ),
      routes: {

        AppRoutes.HOME: (ctx) => const TabsScreen(),
        AppRoutes.CATEGORIE_MEALS: (ctx) => const CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (ctx) => const MealDetailScreen(),
      },
    );
  }
}
