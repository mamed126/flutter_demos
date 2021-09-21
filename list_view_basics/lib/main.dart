import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(ListViewBasic());
}

class ListViewBasic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setItemsList(entries, itemsCount);
    return MaterialApp(
      title: "Listview basics",
      home: scaffOld,
    );
  }

  void setItemsList(List<String> entries, int itemsCount) {
    entries.clear();
    for (int i = 0; i < itemsCount; i++) {
      entries.add("ENTRY->" + (i + 1).toString());
    }
  }
}

Scaffold scaffOld = Scaffold(
  appBar: AppBar(
    title: Text("List view basics..."),
  ),
  body: bodySection,
);

//Widget bodySection = Container(child: listView1);
//Widget bodySection = Container(child: listView2);
Widget bodySection = Container(child: listView3);

int itemsCount = 120;
final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];

Widget listView3 = ListView.separated(
    itemBuilder: itemBuilder,
    separatorBuilder: separatorBuilder,
    itemCount: entries.length);

Widget itemBuilder(BuildContext context, int index) {
  return Container(
    height: 50,
    child: Center(
      child: Text(entries[index]),
    ),
    color: Colors.amber[colorCodes[index % 3]],
  );
}

Widget separatorBuilder(BuildContext context, int index) {
  return Divider();
}

Widget listView2 = ListView.builder(
    padding: const EdgeInsets.all(8),
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 50,
        color: Colors.amber[colorCodes[index]],
        child: Center(child: Text('Entry ${entries[index]}')),
      );
    });

Widget listView1 = ListView(
  padding: const EdgeInsets.all(8),
  //scrollDirection:Axis.horizontal,
  children: <Widget>[
    Container(
      height: 50,
      color: Colors.amber[600],
      child: const Center(child: Text('Entry A')),
    ),
    Container(
      height: 50,
      color: Colors.amber[500],
      child: const Center(child: Text('Entry B')),
    ),
    Container(
      height: 50,
      color: Colors.amber[100],
      child: const Center(child: Text('Entry C')),
    ),
  ],
);
