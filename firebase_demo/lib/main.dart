import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  String _f1Data = "";
  String _f2Data = "";

  getData() {
    FirebaseFirestore.instance
        .collection("yazilar")
        .doc(t1.text)
        .get()
        .then((value) {
      setState(() {
        _f1Data = value.data()!["f1"];
        _f2Data = value.data()!["f2"];
      });
    });
  }

  add() {
    FirebaseFirestore.instance
        .collection("yazilar")
        .doc(t1.text)
        .set({'f1': t2.text, 'f2': t2.text});
  }

  delete() {
    FirebaseFirestore.instance.collection("yazilar").doc(t1.text).delete();
  }

  update() {
    FirebaseFirestore.instance
        .collection("yazilar")
        .doc(t1.text)
        .update({'f1': t2.text, 'f2': t2.text});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Firebase demo"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                TextField(
                  controller: t1,
                ),
                TextField(
                  controller: t2,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          add();
                        },
                        child: Text("Add")),
                    ElevatedButton(
                        onPressed: () {
                          delete();
                        },
                        child: Text("Delete")),
                    ElevatedButton(
                        onPressed: () {
                          update();
                        },
                        child: Text("Update")),
                    ElevatedButton(
                        onPressed: () {
                          getData();
                        },
                        child: Text("Get")),
                  ],
                ),
                ListTile(
                  title: Text(_f1Data),
                  subtitle: Text(_f2Data),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
