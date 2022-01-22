
import 'package:flutter/material.dart';
import 'package:receitas_app/models/meal.dart';
import 'package:receitas_app/utils/app_routes.dart';

class MealItem extends StatelessWidget {
  const MealItem({Key? key, required this.meal}) : super(key: key);

  final Meal meal;
  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.MEAL_DETAIL,
      arguments: meal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        color: Colors.cyan.shade50,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 20,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: Text(
                      meal.title,
                      style: const TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Colors.cyan.shade900,
                      ),
                      const SizedBox(width: 6),
                      Text('${meal.duration.toString()} min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.work,
                        color: Colors.cyan.shade900,
                      ),
                      const SizedBox(width: 6),
                      Text(meal.complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: Colors.cyan.shade900,
                      ),
                      const SizedBox(width: 6),
                      Text(meal.costText),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
