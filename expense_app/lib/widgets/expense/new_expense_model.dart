import 'package:flutter/material.dart';

import 'package:expense_app/models/expense.dart';

class ExpenseModel extends StatefulWidget {
  const ExpenseModel({super.key, required this.onAddExpense});

  final void Function(Expense) onAddExpense;

  @override
  State<ExpenseModel> createState() {
    return _ExpenseModel();
  }
}

class _ExpenseModel extends State<ExpenseModel> {
  final error = {
    "title": "",
    "amount": ""
  };

  DateTime selectedDate = DateTime.now();
  Category selectedCategroy = Category.food;
  
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final dateController = TextEditingController(text: dateFormatter.format(DateTime.now()));

  void _showDatePicker () async {
    FocusScope.of(context).requestFocus(FocusNode());
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context, 
      initialDate: selectedDate,
      firstDate: firstDate, 
      lastDate: now
    );
    if(pickedDate == null) {
      return;
    }
    selectedDate = pickedDate;
    dateController.text = dateFormatter.format(pickedDate);
  }

  void _setError (String key, String message) {
    setState(() {
      error[key] = message;
    });
  }

  void _addExpense() {
    if(titleController.text == "") {
      _setError("title", "Title Cannot be empty");
      return;
    }
    if(amountController.text == "") {
      _setError("amount", "Title Cannot be empty");
      return;
    }
    double? amount = double.tryParse(amountController.text);
    if(amount == null) {
      _setError("amount", "Invalid Amount");
      return;
    }

    final newExpense = Expense(title: titleController.text, amount: amount, category: selectedCategroy, date: selectedDate);
    widget.onAddExpense(newExpense);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 60
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("Add Expense", style: TextStyle(fontSize: 18),),
          const SizedBox(height: 20,),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.receipt_long),
              label: const Text("Expense Title"),
              helperText: error["title"],
              helperStyle: const TextStyle(color: Colors.red)
            ),
            onChanged: (_) {
              _setError("title", "");
            },
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.currency_rupee),
                    label: const Text("Amount"),
                    helperText: error["amount"],
                    helperStyle: const TextStyle(color: Colors.red)
                  ),
                  onChanged: (_) {
                    _setError("amount", "");
                  },
                ),
              ),
              const SizedBox(width: 20,),
              Expanded(
                child: TextField(
                  controller: dateController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.calendar_month),
                    label: Text("Date"),
                    helperText: ""
                  ),
                  onTap: _showDatePicker,
                ),
              )
            ],
          ),
          const SizedBox(height: 20,),
          DropdownButton(
            value: selectedCategroy,
            items: Category.values.map((category) => DropdownMenuItem(
              value: category, 
              child: Row(
                children: [
                  Icon(categoryIcon[category], size: 14,),
                  const SizedBox(width: 8,),
                  Text(category.name),
                ],)
              )).toList(), 
            onChanged: (category) {
              if(category == null) {
                return;
              }
              setState(() {
                selectedCategroy = category;
              });
            }
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: _addExpense, child: const Text("Add Expense")),
              const SizedBox(width: 10,),
              OutlinedButton(onPressed: () {Navigator.pop(context);}, child: const Text("Discard"))
            ],
          )
        ],
      ),
    );
  }
}
