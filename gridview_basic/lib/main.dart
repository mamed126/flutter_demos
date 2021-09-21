import 'package:flutter/material.dart';

void main() {
  runApp(GridViewBasics());
}

class GridViewBasics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Grid view basics",
      home: scaff,
    );
  }
}

Scaffold scaff = Scaffold(
    appBar: AppBar(
      title: Text("Grid view basics"),
    ),
    body: bodySection);

List items = [
  "Item1",
  "Item2",
  "Item3",
  "Item4",
  "Item5",
  "Item6",
  "Item7",
  "Item8",
  "Item9",
  "Item10"
];

Widget bodySection = Container(
  child: gridView,
);

/* GridView gridView = GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
  itemBuilder: (BuildContext c, int index) {
    return Card(
      color: Colors.greenAccent,
      child: Center(
        child: Text(items[index]),
      ),
    );
  },
  itemCount: items.length,
);
 */

GridView gridView = GridView.builder(
  gridDelegate: _gridDel,
  itemBuilder: _gridBuilder,
  itemCount: items.length,
);

SliverGridDelegateWithFixedCrossAxisCount _gridDel =
    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3);

Widget _gridBuilder(BuildContext context, int index) {
  return Card(
    color: Colors.yellowAccent,
    child: Center(
      child: Text(items[index]),
    ),
  );
}
