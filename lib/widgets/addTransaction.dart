import 'package:flutter/material.dart';
import '../models/transaction.dart';

class AddTransaction extends StatelessWidget {
  String? expenseTitle;
  String? expenseAmount;
  String? expenseId;
  Function addTransaction;

  AddTransaction(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(4.0),
        child: Column(
          children: [
            TextField(
              // controller: TextEditingController(text: ""),
              decoration: InputDecoration(labelText: "Title"),
              onChanged: (val){expenseTitle = val;},
            ),
            TextField(
              // controller: TextEditingController(text: ""),
              decoration: InputDecoration(labelText: "Amount"),
              onChanged: (val){expenseAmount = val;},

            ),
            ElevatedButton(
              onPressed: ()
              {
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
