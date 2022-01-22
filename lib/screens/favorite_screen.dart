import 'package:flutter/material.dart';
import 'package:receitas_app/components/meals_item.dart';
import 'package:receitas_app/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key,  required this.favoriteMeal})
      : super(key: key);

   final List<Meal> favoriteMeal;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(
          child: Text(
        'You have no favorite selections',
        style: Theme.of(context).textTheme.headline6,
      ));
    } else {
      return ListView.builder(
        itemCount: favoriteMeal.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: favoriteMeal[index],
          );
        },
      );
    }
  }
}
