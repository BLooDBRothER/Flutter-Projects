import 'package:expense_app/widgets/statistics/statistics.dart';
import 'package:flutter/material.dart';

import "package:expense_app/models/expense.dart";
import 'package:expense_app/widgets/expense/expense_list/expense_list.dart';
import 'package:expense_app/widgets/expense/new_expense_model.dart';

class Expenses extends StatefulWidget {
  const Expenses({
    super.key,
    required this.isDark,
    required this.toggleThem
  });

  final bool isDark;
  final void Function() toggleThem;

  @override
  State<Expenses> createState() => _Expenses();
}

class _Expenses extends State<Expenses> {
  int selectedScreenIndex = 0;

  final List<Expense> _expenseList = [];
  
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
            Icon(Icons.undo,),
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
    setState(() {
      selectedScreenIndex = 0;
    });
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
          ),
          IconButton(
            onPressed: widget.toggleThem, 
            icon: Icon(widget.isDark ? Icons.light : Icons.dark_mode)
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedScreenIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedScreenIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.pie_chart), label: "Statistics")
        ]
      ),
      body: _expenseList.isEmpty ?
      const NoExpense() :
      (
        selectedScreenIndex == 0 ?
        Column(
          children: [
            Expanded(child: ExpenseList(expenses: _expenseList, onRemoveExpense: _removeExpense,)),
          ],
        ) :
        Statistics(expenseList: _expenseList,)
      )
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
