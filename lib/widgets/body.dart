import 'package:flutter/material.dart';
import 'package:shaxsiy_hamyon/widgets/budget.dart';
import 'package:shaxsiy_hamyon/widgets/expense_list.dart';

import '../models/expense.dart';

class Body extends StatelessWidget {
  final List<Expense> expenses;
  final double totalExpense;
  final Function delete;

  Body(
    this.expenses,
    this.totalExpense,
    this.delete,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Budget(
          totalExpense,
        ),
        ExpenseList(expenses, delete),
      ],
    );
  }
}
