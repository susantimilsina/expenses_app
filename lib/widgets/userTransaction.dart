import 'package:intl/intl.dart';
import '../model/transactions.dart';
import 'package:flutter/material.dart';

import 'cards_transaction.dart';
import 'chart.dart';
import 'input_transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key key}) : super(key: key);

  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<UserTransaction> {
  List<Transaction> transactionlist = [
    Transaction(
        amount: 12.00, id: "1", date: DateTime.now().subtract(Duration(days: 3)), item: "New Shoes"),
    Transaction(amount: 20.00, id: "2", date: DateTime.now(), item: "T shirt"),
    Transaction(amount: 55.00, id: "3", date: DateTime.now(), item: "Boxer"),
  ];
  final itemController = TextEditingController();
  final amountController = TextEditingController();

  addTransaction(itemName, amount) {
    Transaction t1 = new Transaction(
        amount: amount,
        item: itemName,
        id: DateTime.now().toString(),
        date: DateTime.now());
    setState(() {
      transactionlist.add(t1);
      itemController.text ="";
      amountController.text="";
    });
  }

  List<Transaction> get _recentTransactions {
    List<Transaction> recent= [];
    for(int i=0; i< transactionlist.length ; i++){
      if(transactionlist[i].date.isAfter(DateTime.now().subtract(Duration(days: 7)))){
        recent.add(transactionlist[i]);
      }
      return recent;
    }
/*    transactionlist.where((element){
      print(element.date.isAfter(DateTime.now().subtract(Duration(days: 7))).toString());
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();*/
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: SingleChildScrollView(
              child: InputTransaction(onPressedHandler: addTransaction, itemController: itemController, amountController: amountController,)),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    itemController.dispose();
    amountController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense App"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Chart(recentTransactions: _recentTransactions,),
            // InputTransaction(onPressedHandler: addTransaction,),
            CardTransaction(listTransaction: transactionlist)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
