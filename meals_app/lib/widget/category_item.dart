import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategroyItem extends StatelessWidget {
  const CategroyItem({
    super.key,
    required this.category,
    required this.selectCategory
  });

  final Category category;
  final void Function() selectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectCategory,
      splashColor: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.40).withOpacity(0.4),
              category.color.withOpacity(0.40).withOpacity(0.2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(14)
        ),
        child: Text(
          category.title,
          softWrap: true,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8)
          ),
        ),
      ),
    );
  }
}
