import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Expense {
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final IconData icon;

  Expense({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    this.icon = Icons.ac_unit,
  });
}

class Expenses {
  List<Expense> _items = [
    Expense(id: "e1", title: "Tarvuz", date: DateTime.now(), amount: 20000),
    Expense(id: "e2", title: "Krasovka", date: DateTime.now(), amount: 300000),
    Expense(
        id: "e3",
        title: "Flutter kursi",
        date: DateTime.now(),
        amount: 2000000),
  ];

  double TotalExpense(DateTime date) {
    final totalExpenseByMonth = itemsByMonth(date);
    return totalExpenseByMonth.fold(0, (previousValue, expense) {
      return previousValue + expense.amount;
    });
  }

  List<Expense> itemsByMonth(DateTime date) {
    return _items
        .where((expense) =>
            expense.date.month == date.month && expense.date.year == date.year)
        .toList();
  }

  List<Expense> get items {
    return _items;
  }

  void AddNewExpense(
      String title, DateTime date, double amount, IconData icon) {
    return _items.add(Expense(
        id: "e${_items.length + 1}",
        title: title,
        date: date,
        amount: amount,
        icon: icon));
  }

  void delete(String id) {
    _items.removeWhere((expense) => expense.id == id);
  }
}
