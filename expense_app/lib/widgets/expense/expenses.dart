import 'package:flutter/material.dart';

import "package:expense_app/models/expense.dart";
import 'package:expense_app/widgets/expense/expense_list/expense_list.dart';
import 'package:expense_app/widgets/expense/new_expense_model.dart';

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
  
  void _addExpense(Expense expense) {
    setState(() {
      _expenseList.add(expense);
    });
  }

  void _expenseOverlayModel () {
    showModalBottomSheet(isScrollControlled: true, context: context, builder: (ctx) => ExpenseModel(onAddExpense: _addExpense));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Expenses"),
        actions: [
          IconButton(
            onPressed: _expenseOverlayModel, 
            icon: const Icon(Icons.add)
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ExpenseList(expenses: _expenseList)),
        ],
      ),
    );
  }
}
