import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return DefaultTabController(length: 3, child: scaffold);
    return MaterialApp(
      title: "Tab bar demo...",
      home: DefaultTabController(length: 6, child: scaffold),
    );
  }
}

Scaffold scaffold = Scaffold(
  appBar: AppBar(
    title: Text("Tab bar demo"),
    bottom: createTabBar(),
  ),
  body: tabBarView,
);

TabBarView tabBarView = TabBarView(
  children: [
    Center(child: Text("Car")),
    Center(child: Text("Transit")),
    Center(child: Text("Bike")),
    Center(child: Text("Boat")),
    Center(child: Text("Railway")),
    Center(child: Text("Bus"))
  ],
);

TabBar createTabBar() {
  return TabBar(
    tabs: [
      Row(children: [Icon(Icons.directions_car), Text("Car")]),
      Row(children: [Icon(Icons.directions_transit), Text("Transit")]),
      Row(children: [Icon(Icons.directions_bike), Text("Bike")]),
      Row(children: [Icon(Icons.directions_boat), Text("Boat")]),
      Row(children: [Icon(Icons.directions_railway), Text("Railway")]),
      Row(children: [Icon(Icons.directions_bus), Text("Bus")]),
    ],
    isScrollable: true,
  );
}
