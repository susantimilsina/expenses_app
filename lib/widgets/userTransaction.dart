import 'package:intl/intl.dart';
import '../model/transactions.dart';
import 'package:flutter/material.dart';

import 'cards_transaction.dart';
import 'input_transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key key}) : super(key: key);

  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<UserTransaction> {
  List<Transaction> transactionlist = [
    Transaction(amount: 12.00, id: "1", date: DateTime.now(), item: "New Shoes"),
    Transaction(
        amount: 20.00, id: "2", date: DateTime.now(), item: "T shirt"),
    Transaction(amount: 55.00, id: "3", date: DateTime.now(), item: "Boxer"),
  ];


  addTransaction(itemName, amount){
    Transaction t1 = new Transaction(
        amount: amount,
        item: itemName,
        id: DateTime.now().toString(),
        date: DateTime.now());
    setState(() {
      transactionlist.add(t1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputTransaction(onPressedHandler: addTransaction,),
        CardTransaction(listTransaction : transactionlist)
      ],
    );
  }
}
