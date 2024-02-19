import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoriteMealsNotifier extends ChangeNotifier {
  final List<Meal> favoriteMeals = [];

  void toggleFavoriteMeal(Meal meal) {
    if(isFavoriteMealPresent(meal)) {
      int index = favoriteMeals.indexOf(meal);
      favoriteMeals.removeAt(index);
    }
    else {
      favoriteMeals.add(meal);
    }
    notifyListeners();
  }

  bool isFavoriteMealPresent(Meal meal) {
    return favoriteMeals.contains(meal);
  }
}

final favoriteMealsProvider = ChangeNotifierProvider((ref) => FavoriteMealsNotifier());
