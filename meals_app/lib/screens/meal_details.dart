import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/provider/favorite_meals.dart';
import 'package:meals_app/widget/meal_detail.dart';

class MealDeatialsScreen extends ConsumerWidget {
  const MealDeatialsScreen({
    super.key,
    required this.meal
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMealsNotifier = ref.watch(favoriteMealsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(favoriteMealsProvider).toggleFavoriteMeal(meal);
            }, 
            icon: favoriteMealsNotifier.isFavoriteMealPresent(meal) ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: MealDetail(meal: meal)
      ),
    );
  }
}
