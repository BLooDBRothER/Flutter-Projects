import 'package:flutter/material.dart';

import "package:expense_app/models/expense.dart";
import 'package:expense_app/widgets/expense/expense_list/expense_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _Expenses();
}

class _Expenses extends State<Expenses> {
  final List<Expense> _expenseList = [
    Expense(title: "Petorl", amount: 200, category: Category.vehicle, date: DateTime.now()),
    Expense(title: "Hoodie", amount: 746, category: Category.clothings, date: DateTime.now()),
    Expense(title: "Dinner", amount: 289, category: Category.food, date: DateTime.now()),
    Expense(title: "Leo", amount: 180, category: Category.entertainment, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: ExpenseList(expenses: _expenseList)),
        ],
      ),
    );
  }
}
