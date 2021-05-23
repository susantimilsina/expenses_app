import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model/transactions.dart';
import 'widgets/userTransaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.yellow,
        fontFamily: "QuickSand"
      ),
      home: UserTransaction(),
    );
  }
}
