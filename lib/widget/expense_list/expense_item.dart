import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/custom_widgets/custom_height.dart';
import 'package:expense_tracker/widget/custom_widgets/custom_width.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const CustomHeight(5),
            Row(
              children: [
                Text('£${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      categoryIcons[expense.category],
                    ),
                    const CustomWidth(
                      5,
                    ),
                    Text(expense.formattedDate.toString()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
