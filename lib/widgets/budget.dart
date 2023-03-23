import 'package:flutter/material.dart';

import 'add_limit.dart';

class Budget extends StatefulWidget {
  final double totalExpense;
  double monthlyBudget = 200000;

  Budget(this.totalExpense);

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  void monthlyBudgetLimit(double amount) {
    setState(() {
      widget.monthlyBudget = amount;
    });
  }

  void addMonthlyLimit(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return AddLimit(monthlyBudgetLimit, widget.monthlyBudget);
        });
  }

  @override
  Widget build(BuildContext context) {
    var percent = widget.totalExpense * 100 / widget.monthlyBudget;
    final double totalPercentage = percent;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: Color.fromRGBO(239, 240, 250, 1),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50), topLeft: Radius.circular(50))),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.694,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    "Oylik byudejetingiz: ",
                  ),
                  TextButton.icon(
                    onPressed: () {
                      addMonthlyLimit(context);
                    },
                    icon: const Icon(
                      Icons.edit,
                      size: 16,
                    ),
                    label: Text(
                      widget.monthlyBudget.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
              Text(totalPercentage < 100
                  ? "${totalPercentage.toStringAsFixed(0)}%"
                  : "100%")
            ],
          ),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10)),
            child: FractionallySizedBox(
              widthFactor: totalPercentage < 100 ? totalPercentage / 100 : 1,
              heightFactor: 1.2,
              child: Container(
                width: double.infinity,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      Colors.blue,
                      Colors.blue,
                      Colors.blue.shade100,
                      Colors.blue,
                    ]),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.blue, blurRadius: 10, spreadRadius: -1)
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
