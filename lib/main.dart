import 'package:flutter/material.dart';
import 'package:receitas_app/data/dummy_data.dart';
import 'package:receitas_app/models/meal.dart';
import 'package:receitas_app/models/settings.dart';
import 'package:receitas_app/screens/categories_meals_screen.dart';
import 'package:receitas_app/screens/meal_detail_screen.dart';
import 'package:receitas_app/screens/settings_screen.dart';
import 'package:receitas_app/screens/tabs_screen.dart';
import 'package:receitas_app/utils/app_routes.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  final List<Meal> favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGlutten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGlutten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      favoriteMeals.contains(meal)
          ? favoriteMeals.remove(meal)
          : favoriteMeals.add(meal);
    });
  }

  bool _isFavorited(Meal meal) {
    return favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Let\'s cook?',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: 'Raleway',
        canvasColor: Colors.cyanAccent.shade400,
        textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
              fontSize: 22,
              fontFamily: 'RobotoCondensed',
            )),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(favoriteMeals),
        AppRoutes.CATEGORIE_MEALS: (ctx) =>
            CategoriesMealsScreen(meal: _availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(
            onToggleFavorite: _toggleFavorite, isFavorited: _isFavorited),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(
              onChangedSettings: _filterMeals,
              settings: settings,
            ),
      },
    );
  }
}
