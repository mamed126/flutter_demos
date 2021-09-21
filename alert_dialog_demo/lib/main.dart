import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "alert diaog demo...",
      home: HomePage(),
    );
  }
}

class HomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("alert dialog demo"),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text("Alert dialog"),
            onPressed: () {
              //print("test");
              showDialog<String>(context: context, builder: alertDialogBuilder)
                  .then((value) {
                showSnackBar(context, value);
              });
            },
          ),
        ));
  }
}

Widget alertDialogBuilder(BuildContext context) {
  return AlertDialog(
    title: Text("Dialog title..."),
    content: Text("Sample alert"),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.pop(context, "Cancel");
          },
          child: Text("Cancel")),
      TextButton(
          onPressed: () {
            Navigator.pop(context, "Ok");
          },
          child: Text("Ok"))
    ],
  );
}

void showSnackBar(BuildContext context, String? value) {
  if (value != null) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("You clicked $value"),
      action: SnackBarAction(
        label: "ok",
        onPressed: () {},
      ),
    ));
  }
}
