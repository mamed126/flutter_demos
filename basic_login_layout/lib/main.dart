import 'package:flutter/material.dart';

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login page...",
      home: scaffold,
    );
  }
}

Widget scaffold = Scaffold(
  appBar: appBarSection,
  body: bodySection,
);

AppBar appBarSection = AppBar(
  title: Text(
    "Login page...",
    style: TextStyle(
      fontSize: 20,
    ),
  ),
  centerTitle: true,
);

Widget bodySection = Container(
  child: Column(
    children: [infoRow, nameRow, passRow, submitRow],
    mainAxisAlignment: MainAxisAlignment.center,
  ),
);

Row infoRow = Row(
  children: [Text("Istifadeci adi ve parolunuzu daxil edin...")],
  mainAxisAlignment: MainAxisAlignment.center,
);

Row nameRow = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Expanded(
      child: Container(
        child: Text("User name:"),
        margin: EdgeInsets.only(left: 20, top: 10),
      ),
      flex: 1,
    ),
    Expanded(
      child: Container(
        child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: "Enter user name..."),
        ),
        margin: EdgeInsets.only(right: 20, top: 10),
      ),
      flex: 2,
    )
  ],
);

Row passRow = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Expanded(
      child: Container(
        child: Text("User password:"),
        margin: EdgeInsets.only(left: 20, top: 10),
      ),
      flex: 1,
    ),
    Expanded(
      child: Container(
        child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: "Enter password..."),
          obscureText: true,
        ),
        margin: EdgeInsets.only(right: 20, top: 10),
      ),
      flex: 2,
    )
  ],
);

Row submitRow = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Expanded(
        child: Container(
      margin: EdgeInsets.all(20),
      child: ElevatedButton(
        child: Text("Login"),
        onPressed: () {},
      ),
    ))
  ],
);
