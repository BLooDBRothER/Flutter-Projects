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
    Expense(title: "Diesel", amount: 200, category: Category.vehicle, date: DateTime.now()),
    Expense(title: "Petorl", amount: 200, category: Category.vehicle, date: DateTime.now()),
  ];
  
  void _addExpense(Expense expense) {
    setState(() {
      _expenseList.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final removeExpenseIndex = _expenseList.indexOf(expense);
    setState(() {
      _expenseList.remove(expense);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.undo, color: Colors.white,),
            SizedBox(width: 8,),
            Text("Undo Deleted Expense")
          ],
        ),
        action: SnackBarAction(
          label: "UNDO", 
          onPressed: () {
            setState(() {
              _expenseList.insert(removeExpenseIndex, expense);
            });
          },
        ),
      )
    );
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
      body: _expenseList.isEmpty ?
      const NoExpense() :
      Column(
        children: [
          Expanded(child: ExpenseList(expenses: _expenseList, onRemoveExpense: _removeExpense,)),
        ],
      ),
    );
  }
}

class NoExpense extends StatelessWidget {
  const NoExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.block),
          Text("No Expenses")
        ]
      ),
    );
  }
}
