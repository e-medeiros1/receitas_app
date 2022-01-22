import 'package:flutter/material.dart';
import 'package:receitas_app/components/meals_item.dart';
import 'package:receitas_app/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
 

  final List<Meal> favoriteM;
  const FavoriteScreen(this.favoriteM);

  @override
  Widget build(BuildContext context) {
    if (favoriteM.isEmpty) {
      return Center(
          child: Text(
        'You have no favorite selections',
        style: Theme.of(context).textTheme.headline6,
      ));
    } else {
      return ListView.builder(
        itemCount: favoriteM.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: favoriteM[index],
          );
        },
      );
    }
  }
}
