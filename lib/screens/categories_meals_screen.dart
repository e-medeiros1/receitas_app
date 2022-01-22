import 'package:flutter/material.dart';
import 'package:receitas_app/components/meals_item.dart';
import 'package:receitas_app/models/category.dart';
import '../models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meal;

  const CategoriesMealsScreen({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = meal.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(category.title)),
        backgroundColor: Colors.cyan.shade50,
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: categoryMeals[index],
          );
        },
      ),
    );
  }
}
