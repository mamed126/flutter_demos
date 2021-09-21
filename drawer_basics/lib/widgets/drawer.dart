import 'package:drawer_basics/routes/Routes.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _createHeader(),
          _createDrawerItem(
              icon: Icons.contacts,
              text: 'Contacts',
              onTap: () =>
                  {Navigator.pushReplacementNamed(context, Routes.contacts)}),
          _createDrawerItem(
              icon: Icons.event,
              text: 'Events',
              onTap: () =>
                  {Navigator.pushReplacementNamed(context, Routes.events)}),
          _createDrawerItem(
              icon: Icons.note,
              text: 'Notes',
              onTap: () =>
                  {Navigator.pushReplacementNamed(context, Routes.notes)}),
          Divider(),
          _createDrawerItem(icon: Icons.collections_bookmark, text: 'Steps'),
          _createDrawerItem(icon: Icons.face, text: 'Authors'),
          _createDrawerItem(
              icon: Icons.account_box, text: 'Flutter Documentation'),
          _createDrawerItem(icon: Icons.stars, text: 'Useful Links'),
          Divider(),
          _createDrawerItem(icon: Icons.bug_report, text: 'Report an issue'),
          ListTile(title: Text('0.0.1'), onTap: () {}),
        ],
      ),
    );
  }
}

Widget _createDrawerItem(
    {IconData? icon, required String text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}

Widget _createHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      /* decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image:  AssetImage('path/to/header_background.png')
              )
              ), */
      child: Stack(children: [
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Flutter Step-by-Step",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
      ]));
}
