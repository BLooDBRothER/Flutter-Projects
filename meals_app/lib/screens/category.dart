import 'package:flutter/material.dart';
import 'package:meals_app/data/sample_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal.dart';
import 'package:meals_app/widget/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final List<Meal> filteredMeal = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealScreen(title: category.title, meals: filteredMeal)
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
        ),
        children: [
          ...availableCategories.map((category) => CategroyItem(category: category, selectCategory: () {_selectCategory(context, category);},)).toList()
        ],
      ),
    );
  }
}
