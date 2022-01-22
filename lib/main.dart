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
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  final List<Meal> _favoriteMeals = [];
  List<Meal> _availableMeals = DUMMY_MEALS;

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
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorited(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Let\'s cook?',
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
        AppRoutes.HOME: (ctx) => TabsScreen(favoriteMeals: _favoriteMeals),
        AppRoutes.CATEGORIE_MEALS: (ctx) => CategoriesMealsScreen(meal: _availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(onToggleFavorite: _toggleFavorite, isFavorited: _isFavorited),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(
              onChangedSettings: _filterMeals,
              settings: settings,
            ),
      },
    );
  }
}
