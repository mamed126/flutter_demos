import 'package:flutter/material.dart';

void main() {
  runApp(ScaffoldTest());
}

class ScaffoldTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "scaffold test",
      home: scaffoldWidget,
    );
  }
}

Widget scaffoldWidget = Scaffold(
  appBar: appBarSection,
  body: bodySection,
  floatingActionButton: floatingBtn,
  floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  drawer: drawerSection,
  bottomNavigationBar: btmNavBar,
);

Widget btmNavBar = BottomNavigationBar(
  unselectedItemColor: Colors.white,
  selectedItemColor: Colors.amber,
  backgroundColor: Colors.grey.shade600,
  items: [
    BottomNavigationBarItem(
      label: "Ana Sayfa",
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      label: "Ara",
      icon: Icon(Icons.search),
    ),
    BottomNavigationBarItem(
      label: "Ekle",
      icon: Icon(Icons.add_box),
    ),
  ],
  onTap: (int index) {
    // BottomNavigationBarItem'a her dokunuşta çalışacak fonksiyon
    print(index.toString());
  },
);

Widget drawerSection = Drawer(
    child: Column(
  children: <Widget>[
    UserAccountsDrawerHeader(
      accountName: Text("Kerim Bora"),
      accountEmail: Text(""),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text("KB"),
      ),
    ),
    ListTile(
      title: new Text("Gelen Kutusu"),
      leading: new Icon(Icons.mail),
    ),
    Divider(
      height: 0.1,
    ),
    ListTile(
      title: new Text("Giden Kutusu"),
      leading: new Icon(Icons.inbox),
    ),
    ListTile(
      title: new Text("Arkadaşlar"),
      leading: new Icon(Icons.people),
    ),
    ListTile(
      title: new Text("Kaydedilenler"),
      leading: new Icon(Icons.save),
    )
  ],
));

Widget floatingBtn = FloatingActionButton.extended(
  onPressed: () {
    print("dont click clicked...");
  },
  label: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [Text("dont click me"), Icon(Icons.add_a_photo)],
  ),
);

AppBar appBarSection = AppBar(
  title: Text("test"),
  backgroundColor: Colors.greenAccent,
  centerTitle: true,
  leading: IconButton(
    icon: Icon(Icons.arrow_left),
    onPressed: () {},
  ),
  actions: [
    IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
    // IconButton(onPressed: () {}, icon: Icon(Icons.refresh))
  ],
);

Widget bodySection = Center(
  child: Container(
      padding: EdgeInsets.all(30),
      width: 300,
      height: 300,
      color: Colors.black12),
);
