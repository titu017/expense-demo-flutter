// This is the Home Page/ Initial UI of the App
import 'package:expense_tracker/widget/expense_list/expense_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _dummyExpense = [
    Expense(
        title: 'Course',
        amount: 20,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Movie',
        amount: 12,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openExpenseModalSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _dummyExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _dummyExpense.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense'),
        actions: [
          IconButton(
            onPressed: _openExpenseModalSheet,
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpenseList(
                expenses: _dummyExpense, onRemoveExpense: _removeExpense),
          ),
        ],
      ),
    );
  }
}
