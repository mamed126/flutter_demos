import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Snackbar demo...")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_a_photo),
      ),
      body: Center(
        child: Builder(builder: (BuildContext ctxOfScaffold) {
          return ElevatedButton(
              child: Text('Show SnackBar'),
              onPressed: () {
                showSnackBarForDelete(ctxOfScaffold);
              });
        }),
        //child: ElevatedButton(onPressed: () {}, child: Text("Delete data")),
      ),
    );
  }
}

void showSnackBarForDelete(BuildContext context) {
  final snackbar = SnackBar(
    content: Text("Data is deleted!"),
    action: SnackBarAction(
        label: "Restore data",
        onPressed: () {
          showSnackMsgForRestore(context);
        }),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

void showSnackMsgForRestore(BuildContext context) {
  final snack = SnackBar(content: Text("Data is restored!"));
  ScaffoldMessenger.of(context).showSnackBar(snack);
}
