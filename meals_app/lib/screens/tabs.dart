import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/favorite_meals.dart';
import 'package:meals_app/screens/category.dart';
import 'package:meals_app/screens/meal.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreen();
  }
}

class _TabScreen extends ConsumerState<TabScreen> {
  int activeScreenIndex = 0;
  Widget? activeScreen;

  @override
  Widget build(BuildContext context) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    switch(activeScreenIndex) {
      case 0: 
        activeScreen = const CategoryScreen();
        break;
      case 1:
        activeScreen = MealScreen(title: "Favorite Meals", meals: favoriteMeals.favoriteMeals);
        break;
    }

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (selectedIndex) {
          setState(() {
            activeScreenIndex = selectedIndex;
          });
        },
        selectedIndex: activeScreenIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.fastfood), label: "Categories"),
          NavigationDestination(icon: Icon(Icons.favorite), label: "Favorites"),
        ]
      ),
      body: activeScreen,
    );
  }
}
