import 'package:flutter/cupertino.dart';
import 'package:provider_demo1/models/weight.dart';

class WeightState with ChangeNotifier {
  List<Weight> _weights = [
    Weight(45, DateTime.utc(2020, 1, 1)),
    Weight(46, DateTime.utc(2021, 1, 1)),
    Weight(48, DateTime.utc(2020, 8, 20)),
  ];

  List<Weight> get weights => _weights;
  Weight get weight => _weights.first;

  addWeight(Weight o) {
    _weights.insert(0, o);
    notifyListeners();
  }
}
