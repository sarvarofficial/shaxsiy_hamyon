import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/IconPicker/icons.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  final Function AddNewExpense;

  AddExpense(this.AddNewExpense);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  DateTime? selectedDate;
  IconData? selectedIcon;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void showMonth(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
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

  void showIconPicker(BuildContext context) {
    FlutterIconPicker.showIconPicker(context).then((icon) {
      if (icon != null) {
        setState(() {
          selectedIcon = icon;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: "Xarajat nomi"),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: amountController,
            decoration: InputDecoration(
              labelText: "Xarajat miqdori",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(selectedDate == null
                  ? "Xarajat kuni tanlanmagan..."
                  : "Xarjat kuni: ${DateFormat("MMMM d-y").format(selectedDate!)}"),
              TextButton(
                onPressed: () {
                  showMonth(context);
                },
                child: Text("KUNNI TANLASH"),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              selectedIcon == null
                  ? Text("Icon tanlanmagan...")
                  : Row(
                      children: [
                        Text("Tanlangan icon:"),
                        Icon(selectedIcon!),
                      ],
                    ),
              TextButton(
                onPressed: () {
                  showIconPicker(context);
                },
                child: Text("ICON TANLASH"),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("BEKOR QILISH"),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isEmpty ||
                        amountController.text.isEmpty ||
                        selectedDate == null) {
                      return;
                    }
                    var title = titleController.text;
                    var amount = double.parse(amountController.text);
                    if (amount <= 0) {
                      return;
                    }

                    widget.AddNewExpense(
                        title, selectedDate, amount, selectedIcon);
                    Navigator.of(context).pop();
                  },
                  child: Text("KIRITISH"))
            ],
          )
        ],
      ),
    );
  }
}
