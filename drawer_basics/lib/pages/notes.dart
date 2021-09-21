import 'package:drawer_basics/widgets/drawer.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  static const String routeName = '/notespage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notes"),
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("Notes")));
  }
}
