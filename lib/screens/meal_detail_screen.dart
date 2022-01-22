import 'package:flutter/material.dart';
import 'package:receitas_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen(
      {Key? key, required this.onToggleFavorite, required this.isFavorited})
      : super(key: key);

  final Function(Meal) onToggleFavorite;
  final bool Function(Meal) isFavorited;

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: 380,
      height: 225,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Colors.blue, Colors.teal, Colors.cyan]),
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      backgroundColor: Colors.cyanAccent.shade400,
      appBar: AppBar(
        backgroundColor: Colors.cyan[50],
        title: Center(child: Text(meal.title)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context, 'Ingredients'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Center(
                        child: Text(
                          meal.ingredients[index],
                          style: const TextStyle(fontSize: 19),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            _createSectionTitle(context, 'Steps'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        title: Text(
                          meal.steps[index],
                          style: const TextStyle(
                              fontSize: 19, color: Colors.white),
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan[50],
        foregroundColor: Colors.cyanAccent[700],
        child: Icon(isFavorited(meal) ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          onToggleFavorite(meal);
        },
      ),
    );
  }
}
