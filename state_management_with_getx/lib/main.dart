import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_management_with_getx/controllers/counter_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Getx demo...",
      home: Scaffold(
        appBar: AppBar(
          title: Text("getx demo"),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final CounterController _counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    _counterController.incrementCounter();
                  },
                  child: Text("Increment")),
              ElevatedButton(
                  onPressed: () {
                    /*
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondPage()),
                    );
                    */
                    Get.to(SecondPage());
                  },
                  child: Text("Goto Decrementer")),
              Text("Counter val:${_counterController.counter}"),
            ],
          )),
    );
  }
}

class SecondPage extends StatelessWidget {
  SecondPage({Key? key}) : super(key: key);
  CounterController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second page..."),
      ),
      body: Container(
        child: Obx(() => Column(
              children: [
                Text("Counter:${_controller.counter}"),
                ElevatedButton(
                    onPressed: () => _controller.decrementCounter(),
                    child: Text("Decrement counter")),
                ElevatedButton(
                    onPressed: () => Get.back(), child: Text("Go home")),
              ],
            )),
      ),
    );
  }
}
