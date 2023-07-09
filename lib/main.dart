import 'package:expense_tracker/widget/expenses.dart';
import 'package:flutter/material.dart';
// import 'package:js/js.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Expenses(),
    ),
  );
}
