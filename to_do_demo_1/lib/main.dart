import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "to_do_demo_1", home: HomePAge());
  }
}

class HomePAge extends StatefulWidget {
  const HomePAge({Key? key}) : super(key: key);

  @override
  _HomePAgeState createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePAge> {
  List items = [];
  int selectedindex = 0;
  Color _color = Colors.transparent;
  TextEditingController t1 = TextEditingController();

  void addItem(String item) {
    setState(() {
      items.add(item);
      t1.clear();
    });
  }

  void deleteItem(int i) {
    setState(() {
      items.removeAt(i);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("todo_demo"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (_, int index) {
                    return Container(
                      color: _color,
                      child: ListTile(
                        subtitle: Text("sub_title"),
                        title: Text(items[index]),
                        onTap: () {
                          setState(() {
                            selectedindex = index;
                            _color = Colors.yellowAccent;
                          });
                        },
                      ),
                    );
                  }),
            ),
            Divider(),
            TextField(
              controller: t1,
              decoration: InputDecoration(hintText: "add new item"),
            ),
            ElevatedButton(
                onPressed: () {
                  addItem(t1.text);
                },
                child: Text("Add item")),
            ElevatedButton(
                onPressed: () {
                  deleteItem(selectedindex);
                },
                child: Text("Delete item")),
          ],
        ),
      ),
    );
  }
}
