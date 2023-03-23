import 'package:flutter/material.dart';

class AddLimit extends StatefulWidget {
  final Function monthlyBudgetLimit;
  final double budgetLimit;

  AddLimit(this.monthlyBudgetLimit, this.budgetLimit);

  @override
  State<AddLimit> createState() => _AddLimitState();
}

class _AddLimitState extends State<AddLimit> {
  late TextEditingController limitAmount;

  @override
  void initState() {
    limitAmount = TextEditingController();
    limitAmount.text = widget.budgetLimit.toStringAsFixed(0);
    super.initState();
  }

  @override
  void dispose() {
    limitAmount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: limitAmount,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: "Oylik limit miqdori: "),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("BEKOR QILISH")),
            ElevatedButton(
                onPressed: () {
                  if (limitAmount.text.isEmpty) {
                    return;
                  }
                  var amount = double.parse(limitAmount.text);
                  if (amount > 0) {
                    return widget.monthlyBudgetLimit(amount);
                  }
                  Navigator.of(context).pop();
                },
                child: Text("KIRITISH"))
          ],
        )
      ],
    );
  }
}
