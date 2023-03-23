import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shaxsiy_hamyon/widgets/lists.dart';

import '../models/expense.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;
  final Function delete;

  ExpenseList(
    this.expenses,
    this.delete,
  );

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: Container(
            padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50))),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.494,
            child: expenses.isNotEmpty
                ? ListView.builder(
                    itemCount: expenses.length,
                    itemBuilder: (context, index) {
                      return Lists(
                          expenses[index].title,
                          expenses[index].amount,
                          expenses[index].date,
                          ValueKey(expenses[index].id),
                          delete,
                          expenses[index].id,
                          expenses[index].icon);
                    })
                : Column(
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      const Text(
                        "Xarajatlaringiz yo'q",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Image.asset(
                        "assets/images/money.png",
                        height: 200,
                      )
                    ],
                  )));
  }
}
