import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:uuid/uuid.dart";

const uuid = Uuid();
final dateFormatter = DateFormat.yMd();

enum Category {food, vehicle, households, entertainment, clothings}
const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.vehicle: Icons.commute,
  Category.households: Icons.house,
  Category.entertainment: Icons.movie,
  Category.clothings: Icons.checkroom,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final Category category;
  final DateTime date;

  String formattedDate() {
    return dateFormatter.format(date);
  }
}

