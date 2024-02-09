import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import "package:expense_app/models/expense.dart";

class Statistics extends StatefulWidget {
  const Statistics({super.key, required this.expenseList});

  final List<Expense> expenseList;

  @override
  State<Statistics> createState() {
    return _Statistics();
  }
}


class _Statistics extends State<Statistics> {
  final Map<Category, double> categoryMap = {};
  late List<CategoryExpense> categoryExpense = [];
  late double totalAmountSpend = 0;

  @override
  void initState() {
    _sumCategoryExpense();
    super.initState();
  }

  void _sumCategoryExpense() {
    double totalAmount = 0;
    for (var expense in widget.expenseList) {
      totalAmount += expense.amount; 
      if(categoryMap.containsKey(expense.category)) {
        categoryMap[expense.category] = categoryMap[expense.category]! + expense.amount;
      }
      else {
        categoryMap[expense.category] = expense.amount;
      }
    }
    setState(() {
      totalAmountSpend = totalAmount;
      categoryMap.forEach((key, value) {
        categoryExpense.add(CategoryExpense(category: key, amount: value));
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          //Initialize the chart widget
          SfCircularChart(
              // Chart title
              title: const ChartTitle(text: 'Expense Analysis'),
              // Enable legend
              legend: const Legend(
                isVisible: true,
                isResponsive: true,
                overflowMode: LegendItemOverflowMode.wrap
              ),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <PieSeries<CategoryExpense, String>>[
                        PieSeries<CategoryExpense, String>(
                          dataSource: categoryExpense,
                          xValueMapper: (CategoryExpense expense, _) => expense.category.name, 
                          yValueMapper: (CategoryExpense expense, _) => expense.amount,
                          dataLabelMapper: (CategoryExpense expense, _) => expense.amount.toString(),
                          dataLabelSettings: const DataLabelSettings(isVisible: true),
                        )
                      ],
          ),
          const SizedBox(height: 20,),
          Text("Total Amount Spend: $totalAmountSpend")
        ]);
  }
}

class CategoryExpense {
  CategoryExpense({
    required this.category,
    required this. amount
  });

  final Category category;
  final double amount;
}
