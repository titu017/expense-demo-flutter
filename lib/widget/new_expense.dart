import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/custom_widgets/custom_height.dart';
import 'package:expense_tracker/widget/custom_widgets/custom_width.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
  // var _inputTitleValue = '';

  // void _getTheTitleValue(String titleValue) {
  //   _inputTitleValue = titleValue;
  // }

  void _showDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 10, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        16,
      ),
      child: ListView(
        children: [
          //Title starts from here
          TextField(
            controller: _titleController,
            // onChanged: _getTheTitleValue,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          //title ends here

          // The amount and calendar picker section STARTED from here
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefixText: '£',
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'Select Date'
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _showDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //The amount and calendar picker section ENDS here

          const CustomHeight(5),

          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print(
                    _titleController.text +
                        _amountController.text +
                        ' date: ' +
                        _selectedDate.toString(),
                  );
                  // print(_inputTitleValue);
                },
                child: const Text('Save Expense'),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Cancel',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}