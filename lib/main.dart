import 'package:expense_tracker/userTransactions.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}


class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        centerTitle: true,
      ),
      body: UserTransactions(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(
          Icons.add
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
