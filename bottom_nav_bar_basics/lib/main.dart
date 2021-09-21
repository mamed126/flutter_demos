import 'package:bottom_nav_bar_basics/pages/contacts.dart';
import 'package:bottom_nav_bar_basics/pages/mails.dart';
import 'package:bottom_nav_bar_basics/pages/profiles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bottom nav bar basics",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  ContactsPage _contactsPage = ContactsPage();
  MailsPage _mailsPage = MailsPage();
  ProfilesPage _profilesPage = ProfilesPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom nav bar"),
      ),
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_page), label: "Contacts"),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Mails"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profiles"),
        ],
        onTap: (int index) {
          onTapHandler(index);
        },
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget getBody() {
    if (_selectedIndex == 0) {
      return _contactsPage;
    } else if (_selectedIndex == 1) {
      return _mailsPage;
    } else {
      return _profilesPage;
    }
  }

  void onTapHandler(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
