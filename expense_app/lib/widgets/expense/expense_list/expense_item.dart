import 'package:expense_app/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return (
      Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(categoryIcon[expense.category], size: 17),
                  const SizedBox(width: 8,),
                  Text(expense.title, style: const TextStyle(
                    fontSize: 18
                  ),),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.currency_rupee, size: 14,),
                      Text(expense.amount.toStringAsFixed(2))
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(Icons.alarm, size: 17),
                      const SizedBox(width: 8,),
                      Text(expense.formattedDate()),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
