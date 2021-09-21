import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  incrementCounter() => counter++;
  decrementCounter() => counter--;
}
