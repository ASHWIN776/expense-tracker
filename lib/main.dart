import 'package:expense_tracker/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}


class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'Sneakers', cost: 1987.4, date: DateTime.now()),
    Transaction(id: 't2', title: 'Chinos', cost: 2019, date: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          Column(
            children: transactions.map(
              (t) => Card(child: Text(t.title))
            ).toList(),
          )
        ],
      ),
    );
  }
}
