import 'showTransactions.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'addTransaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [];

  addTransaction(expenseTitle, expenseAmount, expenseId){
    setState(() {
      _transactions.add(Transaction(id: expenseId!, title: expenseTitle!, cost: expenseAmount!, date: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: double.infinity,
          child: Card(
            color: Colors.blueAccent,
            elevation: 5,
            child: Text(
              "Expense Chart",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),
        ),
        AddTransaction(addTransaction),
        ShowTransactions(_transactions)
      ],
    );
  }
}
