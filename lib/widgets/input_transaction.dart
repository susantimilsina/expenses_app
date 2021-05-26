import 'package:flutter/material.dart';

class InputTransaction extends StatelessWidget {
  Function onPressedHandler;
  TextEditingController itemController;
  TextEditingController amountController;
  InputTransaction({Key key, this.onPressedHandler, this.itemController, this.amountController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: itemController,
              decoration: InputDecoration(
                labelText: "Item Name",
              ),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Amount",
              ),
            ),
            RaisedButton(
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: () {
                String itemName = itemController.text;
                double amount = double.parse(amountController.text);
                if(itemName.isEmpty || amount < 0){
                  return;
                }
                onPressedHandler(itemName, amount);
              },
            )
          ],
        ),
      ),
    );
  }
}
