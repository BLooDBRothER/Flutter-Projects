import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widget/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    required this.title,
    required this.meals
  });

  final String title;
  final List<Meal> meals;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MealDeatialsScreen(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: meals.isEmpty ?
        const NotifyLater() : 
        ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(meal: meals[index], onSelectMeal: () {_selectMeal(context, meals[index]);},),
        ),
    );
  }
}

class NotifyLater extends StatelessWidget {
  const NotifyLater({super.key});

  static const String notifyImg = "assets/Notify.png";

  @override
  Widget build(BuildContext context) {
   return SizedBox(
    width: double.infinity,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(notifyImg, width: 300,),
      const SizedBox(height: 20,),
      Text("No Meals right now", style: Theme.of(context).textTheme.titleLarge,),
    ],
    ),
   );
  }
}
