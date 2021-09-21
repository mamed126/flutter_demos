import 'package:flutter/material.dart';

void main() {
  runApp(ListViewMixed());
}

class ListViewMixed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "List view with mixed ",
      home: scaffold,
    );
  }
}

Scaffold scaffold = Scaffold(
  appBar: AppBar(
    title: Text("List mixed"),
  ),
  body: bodySection,
);

Widget bodySection = Container(
  child: _listView,
);

abstract class ListItem {
  Widget buildTitle(BuildContext c);
  Widget buildSubTitle(BuildContext c);
}

class HeadingItem implements ListItem {
  final String headText;
  HeadingItem(this.headText);

  @override
  Widget buildTitle(BuildContext c) {
    return Text(
      headText,
      style: Theme.of(c).textTheme.headline5,
    );
  }

  @override
  Widget buildSubTitle(BuildContext c) {
    return SizedBox.shrink();
  }
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildSubTitle(BuildContext c) {
    return Text(body);
  }

  @override
  Widget buildTitle(BuildContext c) {
    return Text(sender);
  }
}

final int itemsCount = 10;

var _items = generateItems(itemsCount);

List<ListItem> generateItems(int itemsCount) {
  List<ListItem> res = [];

  for (int i = 0; i < itemsCount; i++) {
    if (i % 3 == 0) {
      res.add(MessageItem("sender: $i", "body: $i"));
    } else {
      res.add(HeadingItem("this is head $i"));
    }
  }

  return res;
}

ListView _listView = ListView.builder(
  itemBuilder: getItems,
  itemCount: _items.length,
);
Widget getItems(BuildContext context, int index) {
  final item = _items[index];

  return ListTile(
    title: item.buildTitle(context),
    subtitle: item.buildSubTitle(context),
  );
}
