import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Header extends StatelessWidget {
  final double totalExpense;
  final Function showMonth;
  final DateTime selectedDate;
  final Function nextDate;
  final Function lastDate;

  Header(this.totalExpense, this.showMonth, this.selectedDate, this.nextDate,
      this.lastDate);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    showMonth(context);
                  },
                  child: Text(
                    "${DateFormat("MMMM ,y").format(selectedDate)}",
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    lastDate();
                  },
                  icon: const Icon(
                    Icons.arrow_left,
                    size: 32,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    totalExpense.toString(),
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "so'm",
                    style: TextStyle(height: 0.6, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    nextDate();
                  },
                  icon: const Icon(
                    Icons.arrow_right,
                    size: 32,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
