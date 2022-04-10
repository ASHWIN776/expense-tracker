import 'package:flutter/material.dart';

class AddTransaction extends StatelessWidget {
  String? expenseTitle;
  double? expenseAmount;
  String? expenseId;
  Function addTransaction;
  final amountController = TextEditingController();
  final titleController = TextEditingController();

  AddTransaction(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(4.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),

            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.number
            ),
            ElevatedButton(
              onPressed: ()
              {
                expenseAmount = double.parse(amountController.text);
                expenseTitle = titleController.text;

                expenseId = DateTime.now().toString();
                addTransaction(expenseTitle, expenseAmount, expenseId);
               },
              child: Text("Add Transaction"))
          ],
        ),
      ),
    );
  }
}
