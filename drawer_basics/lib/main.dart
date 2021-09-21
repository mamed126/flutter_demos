import 'package:drawer_basics/pages/contacts.dart';
import 'package:drawer_basics/pages/events.dart';
import 'package:drawer_basics/pages/notes.dart';
import 'package:drawer_basics/routes/Routes.dart';
import 'package:drawer_basics/widgets/drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Drawer basics",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Drawer basic_"),
        ),
        drawer: AppDrawer(),
      ),
      routes: {
        Routes.contacts: (context) => ContactsPage(),
        Routes.events: (context) => EventsPage(),
        Routes.notes: (context) => NotesPage(),
      },
    );
  }
}
