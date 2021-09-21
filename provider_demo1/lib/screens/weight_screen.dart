import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo1/models/weight.dart';
import 'package:provider_demo1/states/weight_state.dart';
import 'package:numberpicker/numberpicker.dart';

class WeightScreen extends StatelessWidget {
  const WeightScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Provider demo"),
        ),
        body: Consumer<WeightState>(
          builder: (context, state, child) {
            var weights = state.weights;
            return Column(
              children: [
                Container(
                  child: Expanded(
                    child: ListView.builder(
                        itemCount: state.weights.length,
                        itemBuilder: (context, index) {
                          var weight = weights[index];
                          return ListTile(
                            title: Text(weight.date.toString()),
                            trailing: Text(weight.value.toString()),
                          );
                        }),
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var state = Provider.of<WeightState>(context, listen: false);
            var result =
                await _showAddWeightDialog(context, state.weight.value);

            if (result != null && result > 0) {
              state.addWeight(Weight(result, DateTime.now()));
            }
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

Future<double> _showAddWeightDialog(
    BuildContext context, double currentWeight) async {
  return await showDialog<double>(
      context: context,
      builder: (BuildContext context) {
        return NumberPickerDialog.decimal(
            minValue: 1, maxValue: 200, initialDoubleValue: currentWeight);
      });
}
