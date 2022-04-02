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

  final months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov",
  "Dec"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        centerTitle: true,
      ),
      body: Column(
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
                  TextField(decoration: InputDecoration(labelText: "Title")),
                  TextField(decoration: InputDecoration(labelText: "Amount")),
                  ElevatedButton(onPressed: (){}, child: Text("Add Transaction"))
                ],
              ),
            ),
          ),
          Column(
            children: transactions.map(
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
      ),
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
