import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = const Color.fromRGBO(176, 190, 197, 1)
  });

  final String id;
  final String title;
  final Color color;
}
