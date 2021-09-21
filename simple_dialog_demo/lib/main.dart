import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "simple dialog...",
      home: SimpleDialogPage(),
    );
  }
}

class SimpleDialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("simple dialog..."),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Simple dialog."),
          onPressed: () {
            showDialog(context: context, builder: dlgBuilder).then((value) {
              if (value != null) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("clicked:$value")));
              }
            });
          },
        ),
      ),
    );
  }

  Widget dlgBuilder(BuildContext context) {
    return SimpleDialog(
      title: Text("Dialog title"),
      children: [
        ListTile(
          leading: Icon(Icons.account_box),
          title: Text("Account"),
          onTap: () {
            Navigator.pop(context, "Account");
          },
        ),
        ListTile(
          leading: Icon(Icons.mail),
          title: Text("Mail"),
          onTap: () {
            Navigator.pop(context, "Mail");
          },
        )
      ],
    );
  }
}
