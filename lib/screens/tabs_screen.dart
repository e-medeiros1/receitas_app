import 'package:flutter/material.dart';
import 'package:receitas_app/components/main_drawer.dart';
import 'package:receitas_app/models/meal.dart';

import 'package:receitas_app/screens/categories_screens.dart';
import 'package:receitas_app/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen({
    Key? key,
    required this.favoriteMeals,
  }) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  late List<Widget> _screens;
  late List<String> _titles;

  @override
  void initState() {
    super.initState();

    _screens = [
      const CategoriesScreens(),
      const FavoriteScreen(favoriteMeal: []),
    ];
    _titles = [
      'Categories list',
      'My favorites',
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            _titles[_selectedScreenIndex],
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        backgroundColor: Colors.white70,
        enableFeedback: true,
        unselectedItemColor: Colors.black54,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        items: const [
          BottomNavigationBarItem(
            // backgroundColor: Colors.white70,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            // backgroundColor: Colors.white70,
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
