import 'package:drawer_basics/widgets/drawer.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  static const String routeName = '/eventspage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Events"),
        ),
        drawer: AppDrawer(),
        body: Center(child: Text("Events")));
  }
}
