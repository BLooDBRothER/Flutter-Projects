import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({
    super.key,
    required this.meal
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
            borderRadius: BorderRadius.circular(14)
          ),
          child: FadeInImage(
            placeholder: MemoryImage(kTransparentImage), 
            image: NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
            borderRadius: BorderRadius.circular(14)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Ingridents", style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: 20,),
              ...meal.ingredients.map((ingredient) {
                return (
                  Text("\u2022 $ingredient")
                );
              }).toList()
            ]
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
            borderRadius: BorderRadius.circular(14)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Ingridents", style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: 20,),
              ...meal.steps.map((step) {
                return (
                  Text("\u2022 $step")
                );
              }).toList()
            ]
          ),
        )
      ],
    );
  }
}
