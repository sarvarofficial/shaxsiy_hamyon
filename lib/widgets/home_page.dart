import 'package:flutter/material.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';
import 'package:shaxsiy_hamyon/models/expense.dart';
import 'package:shaxsiy_hamyon/widgets/body.dart';
import 'package:shaxsiy_hamyon/widgets/header.dart';

import 'add_expense.dart';
import 'add_limit.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();
  Expenses expensesData = Expenses();

  void showModalPanel(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AddExpense(AddNewExpense);
        });
  }

  void AddNewExpense(
      String title, DateTime date, double amount, IconData icon) {
    setState(() {
      expensesData.AddNewExpense(title, date, amount, icon);
    });
  }

  void showMonth(BuildContext context) {
    showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedDate = value;
        });
      }
    });
  }

  void lastDate() {
    setState(() {
      selectedDate = DateTime(selectedDate.year, selectedDate.month + 1);
    });
  }

  void nextDate() {
    setState(() {
      selectedDate = DateTime(selectedDate.year, selectedDate.month - 1);
    });
  }

  void deleteExpense(String id) {
    setState(() {
      expensesData.delete(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mening Hamyonim"),
      ),
      body: Column(
        children: [
          Header(expensesData.TotalExpense(selectedDate), showMonth,
              selectedDate, lastDate, nextDate),
          const SizedBox(
            height: 32,
          ),
          Body(expensesData.itemsByMonth(selectedDate),
              expensesData.TotalExpense(selectedDate), deleteExpense),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalPanel(context);
          },
          child: const Icon(Icons.add)),
    );
  }
}
