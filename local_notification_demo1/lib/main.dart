import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterLocalNotificationsPlugin? _notPlag;

  Future onSelectNotification(String? payload) async {
    showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          title: Text("PayLoad"),
          content: Text("Payload : $payload"),
        );
      },
    );
  }

  showNotification() async {
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.high, importance: Importance.max);

    var iOS = new IOSNotificationDetails();

    var platform = new NotificationDetails(android: android, iOS: iOS);

    await _notPlag?.show(0, 'New Tutorial', 'Local Notification', platform,
        payload: "test");
  }

  @override
  void initState() {
    super.initState();
    _notPlag = FlutterLocalNotificationsPlugin();

    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();

    InitializationSettings initSetttings =
        new InitializationSettings(android: android, iOS: iOS);

    _notPlag?.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notification demo 1",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Notification demo..."),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text("Notify"),
            onPressed: () {
              showNotification();
            },
          ),
        ),
      ),
    );
  }
}
