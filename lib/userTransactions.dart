import 'package:flutter/material.dart';
import './models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(id: 't1', title: 'Sneakers', cost: 1987.4, date: DateTime.now()),
    Transaction(id: 't2', title: 'Chinos', cost: 2019, date: DateTime.now())
  ];
  final months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov",
    "Dec"];

  String? expenseTitle;
  String? expenseAmount;
  String? expenseId;

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
        Card(
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
                ElevatedButton(onPressed: (){
                  expenseId = "t${_transactions.length}";

                  setState(() {
                    _transactions.add(Transaction(id: expenseId!, title: expenseTitle!, cost: double.parse(expenseAmount!), date: DateTime.now()));
                  });

                  _transactions.forEach((element) {
                    print("Expense Title : ${element.title}, Expense Amount : ${element.cost}");
                  });
                }, child: Text("Add Transaction"))
              ],
            ),
          ),
        ),
        Column(
          children: _transactions.map(
                  (t) => Card(
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10.0),
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent, width: 2.0)
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.currency_rupee,
                                color: Colors.blueAccent,
                              ),
                              Text(
                                t.cost.toStringAsFixed(2),
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          )
                      ),
                      Expanded(
                          child: ListTile(
                            title: Text(
                              t.title,
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            subtitle: Text("${t.date.day} ${months[t.date.month - 1]} ${t.date.year}"),
                          )
                      ),
                      IconButton(
                          onPressed: (){print("Deleted");},
                          icon: Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                          )
                      )
                    ],
                  )
              )
          ).toList(),
        )
      ],
    );
  }
}
