import 'package:flutter/material.dart';
import 'package:receitas_app/components/main_drawer.dart';
import 'package:receitas_app/models/meal.dart';

import 'package:receitas_app/screens/categories_screens.dart';
import 'package:receitas_app/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  // List<Widget>? _screens = [];
  // List<String>? _titles;

  // @override
  // void initState() {
  //   super.initState();

  //   _screens = [
  //     const CategoriesScreens(),
  //     FavoriteScreen(
  //       favoriteMeals: _favoriteMeals,
  //     ),
  //   ];
  //   _titles = [
  //     'Categories list',
  //     'My favorites',
  //   ];
  // }

  // _selectScreen(int index) {
  //   setState(() {
  //     _selectedScreenIndex = index;
  //   });
  // }

  final List<String> _titles = [
    'Categories list',
    'My favorites',
  ];

  List<Widget>? _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const CategoriesScreens(),
      FavoriteScreen(widget.favoriteMeals),
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
        backgroundColor: Colors.cyan[50],
        title: Center(
          child: Text(
            _titles[_selectedScreenIndex],
            style: const TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
      ),
      drawer: const MainDrawer(),
      body: _screens![_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        // showUnselectedLabels: false,
        backgroundColor: Colors.cyan.shade50,
        enableFeedback: true,
        unselectedItemColor: Colors.cyan.shade900,
        selectedItemColor: Colors.cyanAccent.shade700,
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
