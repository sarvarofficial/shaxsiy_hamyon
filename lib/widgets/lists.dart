import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Lists extends StatelessWidget {
  final String title;
  final double amount;
  final DateTime date;
  final Key _key;
  final Function delete;
  final String id;
  final selectedIcon;

  Lists(this.title, this.amount, this.date, this._key, this.delete, this.id,
      this.selectedIcon,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        delete(id);
      },
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.only(right: 15),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      key: _key,
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(selectedIcon),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          DateFormat("d-MMMM-y").format(date),
          style: TextStyle(fontSize: 12),
        ),
        trailing: Text("${amount} so'm"),
      ),
    );
  }
}
