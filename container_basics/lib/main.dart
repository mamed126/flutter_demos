import 'package:flutter/material.dart';

void main() {
  runApp(ContainerBasics());
}

class ContainerBasics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "container basics",
      home: Scaffold(
        appBar: AppBar(
          title: Text("container basics"),
        ),
        body: bodySection,
      ),
    );
  }
}

Widget bodySection = Container(
  margin: EdgeInsets.all(30),
  padding: EdgeInsets.all(20),
  alignment: Alignment.center,
  color: Colors.amber,
  child: Text("i am container body text"),
);
