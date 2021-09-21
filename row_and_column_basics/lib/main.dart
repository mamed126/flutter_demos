import 'package:flutter/material.dart';

void main() {
  runApp(RowAndColBasics());
}

class RowAndColBasics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "row_and_columns_basics",
      home: scaffold,
    );
  }
}

Widget scaffold = Scaffold(
  appBar: appBarSection,
  body: bodySection,
);

AppBar appBarSection = AppBar(
  title: Text("Rows and columns basics"),
);
Widget bodySection = Container(
    child: Column(
  //mainAxisAlignment: MainAxisAlignment.center,
  children: [
    firstRow,
    secondRow,
  ],
));

Widget firstRow = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [Text("text1"), Text("text2")],
);

Widget secondRow = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Expanded(
      child: Container(
        child: Text("text3"),
        color: Colors.green,
      ),
      flex: 2,
    ),
    Expanded(
      child: Container(
        child: Text("text4"),
        color: Colors.yellow,
      ),
      flex: 3,
    ),
  ],
);
