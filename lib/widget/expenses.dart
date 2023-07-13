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
    final expenseIndex = _dummyExpense.indexOf(expense);
    setState(() {
      _dummyExpense.remove(expense);
    });
    ScaffoldMessenger.of(context)
        .clearSnackBars(); //to clear message if there is any active message e.g. when removing two item from the list, the message of the first removed content will be cleaned

    // this method is used to show message when removing an expense from the list
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Succesfully Deleted',
        ),
        duration: const Duration(
          seconds: 3,
        ),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _dummyExpense.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
        child: Text('No expense added yet. Starting adding your expense.'));

    if (_dummyExpense.isNotEmpty) {
      // to show message on the screen if there is no expense
      mainContent =
          ExpenseList(expenses: _dummyExpense, onRemoveExpense: _removeExpense);
    }
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
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
