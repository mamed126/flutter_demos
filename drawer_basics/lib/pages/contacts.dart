import 'package:drawer_basics/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  static const String routeName = '/contactspage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("Contacts")));
  }
}
