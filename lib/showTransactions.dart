import 'package:flutter/material.dart';
import './models/transaction.dart';

class ShowTransactions extends StatelessWidget {
  List<Transaction> transactions;
  final months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov",
    "Dec"];
  ShowTransactions(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
