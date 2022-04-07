import 'package:flutter/material.dart';
import './models/transaction.dart';

class AddTransaction extends StatelessWidget {
  String? expenseTitle;
  String? expenseAmount;
  String? expenseId;
  Function addTransaction;
  List<Transaction> transactions;

  AddTransaction({required this.transactions,required this.addTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(4.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              onChanged: (val){expenseTitle = val;},
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              onChanged: (val){expenseAmount = val;},

            ),
            ElevatedButton(
              onPressed: ()
              {
                expenseId = "t${transactions.length}";
                addTransaction(expenseTitle, expenseAmount, expenseId);
               },
              child: Text("Add Transaction"))
          ],
        ),
      ),
    );
  }
}
