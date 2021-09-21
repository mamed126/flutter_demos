import 'package:flutter/material.dart';
 //ignore: import_of_legacy_library_into_null_safe
//@dart=2.9
// ignore: import_of_legacy_library_into_null_safe
// @dart=2.9
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Splash screen demo",
      home: SplashScreenPage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => HomePage(),
        '/details': (BuildContext context) => DetailsPage(),
        '/about': (BuildContext context) => AboutPage(),,
    );
  }
}

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  
    return SplashScreen(
        title: new Text('Welcome In SplashScreen'),
        /*  image: new Image.network(
            'https://s3.o7planning.com/images/triceratops/image1.png'), */
        backgroundColor: Colors.white,
        photoSize: 100.0,
        loaderColor: Colors.red,
        seconds: 15,
        navigateAfterSeconds: "/home");
  
}}

 class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title of Home Page"),
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            child: Text('Go to Details Page'),
            onPressed: () {
              Navigator.of(context).pushNamed('/details');
            },
          ),
          ElevatedButton(
            child: Text('Go to About Page'),
            onPressed: () {
              Navigator.of(context).pushNamed('/about');
            },
          ),
        ],
      )),
    );
  }
}

class DetailsPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title of Details Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Close'),
          onPressed: () {
            // Close page and pass a value back to previous page
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.lightGreen[100],
    );
  }
}

class AboutPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title of About Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Close'),
          onPressed: () {
            // Close page
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.cyan[100],
    );
  }
} 
