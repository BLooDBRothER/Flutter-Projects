import 'package:expense_app/widgets/expense/expense_list/expense_item.dart';
import 'package:flutter/material.dart';

import 'package:expense_app/models/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key, 
    required this.expenses,
    required this.onRemoveExpense
  });

  final List<Expense> expenses;
  final void Function(Expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return (
      ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(expenses[index]),
          background: Container(
            // color: Colors.red,
            color: Theme.of(context).colorScheme.error,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: AlignmentDirectional.centerEnd,
            child: const Icon(Icons.delete, color: Colors.white,),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
          },
          child: ExpenseItem(expenses[index])
        )
      )
    );
  }
}
