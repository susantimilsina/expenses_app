import 'package:expenses_app/model/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardTransaction extends StatelessWidget {
  List<Transaction> listTransaction;

  CardTransaction({Key key, this.listTransaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        color: Colors.transparent,
        child: listTransaction.isEmpty
            ? Container(
                height: 100,
                child: Image.asset(
                  "assets/images/waiting.png",
                  fit: BoxFit.fitWidth,
                ),
              )
            : Card(
                child: ListView.builder(
                    itemCount: listTransaction.length,
                    itemBuilder: (context, index) {
                      return Row(children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2),

                          ),
                          child: Text(
                            " \$  ${listTransaction[index].amount.toStringAsFixed(2)}",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 28,
                                fontFamily: "OpenSans"),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listTransaction[index].item,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  fontFamily: "OpenSans"),
                            ),
                            Text(DateFormat()
                                .add_yMMMd()
                                .format(listTransaction[index].date)),
                          ],
                        )
                      ]);
                    })));
  }
}
