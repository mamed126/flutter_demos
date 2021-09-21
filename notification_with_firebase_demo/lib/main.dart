import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

//android/app icerisine google-services.json elave edilir
//android/build.gradle set olunur (dependncies-e elave olunur)
//android/app/build.gradle set olunur
//flutter get packages icra edilir
//pubspec.yml-e pluginler elave edilir

void main() {
  Firebase?.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseMessaging? _msg;
  @override
  void initState() {
    super.initState();

    _msg = FirebaseMessaging.instance;

    _msg?.getToken().then((value) => print("token:$value"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("firebase notifications"),
      ),
      body: Center(),
    );
  }
}
