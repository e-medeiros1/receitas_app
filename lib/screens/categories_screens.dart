import 'package:flutter/material.dart';
import 'package:receitas_app/components/category_item.dart';
import 'package:receitas_app/data/dummy_data.dart';

class CategoriesScreens extends StatelessWidget {
  const CategoriesScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Let\'s cook?',
          style: TextStyle(fontSize: 24),
        )),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map((cat) {
          return CategoryItens(
            category: cat,
          );
        }).toList(),
      ),
    );
  }
}
