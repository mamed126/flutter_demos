import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Permission demo 1",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PermissionStatus? _perStatus;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback(onLayoutDone);
  }

  void onLayoutDone(Duration timeStamp) async {
    _perStatus = await Permission.camera.status;
    setState(() {});
  }

  void _askCameraPermission() async {
    if (await Permission.camera.request().isGranted) {
      _perStatus = await Permission.camera.status;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Permission demo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("$_perStatus"),
            ElevatedButton(
              onPressed: () {
                _askCameraPermission();
              },
              child: Text("Request camera permission"),
            )
          ],
        ),
      ),
    );
  }
}
