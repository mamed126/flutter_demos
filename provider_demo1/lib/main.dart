//pubspec.yaml -a provider package elave edilir
//
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo1/screens/weight_screen.dart';
import 'package:provider_demo1/states/weight_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) {
          return WeightState();
        }),
      ],
      child: MaterialApp(
        home: WeightScreen(),
        title: "Provider demo",
      ),
    );
  }
}
