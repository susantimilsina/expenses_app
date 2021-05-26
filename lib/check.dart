import 'package:flutter/material.dart';

class Check extends StatefulWidget {
  const Check({Key key}) : super(key: key);

  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.red,
              height: height * 0.4,
              width: double.infinity,
              child: Text("adasd"),
            ),

            Container(
              color: Colors.blue,
              height: height * 0.2,
              width: double.infinity,
              child: Text("adasd"),
            ),

            // LayoutBuilder(builder: builder)

            // Flexible(
            //   child: Container(
            //     height: 100,
            //     // width: 600,
            //     color: Colors.red,
            //     child: FittedBox(
            //         child: Text(
            //             "Item 1: asdasd  ad ")),
            //   ),
            // ),
            // Flexible(
            //   child: Container(
            //     height: 100,
            //     // width: 500,
            //     color: Colors.yellow,
            //     child: Text("Item 2 "),
            //   ),
            // ),
            // Flexible(
            //     child: Container(
            //   height: 100,
            //   // width: 200,
            //   color: Colors.green,
            //   child: Text("Item 3: Child"),
            // ))
          ],
        ),
      ),
    );
  }
}
