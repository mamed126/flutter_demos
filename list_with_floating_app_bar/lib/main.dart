import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List with floating app bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListWithFloatingAppBar(),
    );
  }
}

const String _title = "List with floatin app bar";

class ListWithFloatingAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*   appBar: AppBar(
        title: Text(_title),
      ), */
      body: bodySection,
    );
  }
}

Widget bodySection = CustomScrollView(
  slivers: [
    SliverAppBar(
      floating: false,
      pinned: true,
      expandedHeight: 150.0,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      flexibleSpace: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 200,
            child: FlexibleSpaceBar(title: Text("User Status")),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),

      // Make the initial height of the SliverAppBar larger than normal.

      // leading: Text("leading text"),
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate((_, i) {
        return ListTile(title: Text("Item ${i}"));
      }, childCount: 20),
    ),
  ],
);
