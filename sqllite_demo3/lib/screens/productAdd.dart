import 'package:sqllite_demo3/helpers/db_helper.dart';
import 'package:sqllite_demo3/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductAddState();
}

class ProductAddState extends State {
  DbHelper dbHelper = new DbHelper();

  TextEditingController txtName = new TextEditingController();
  TextEditingController txtDescription = new TextEditingController();
  TextEditingController txtPrice = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new product"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: txtName,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: txtDescription,
              decoration: InputDecoration(labelText: "Description"),
            ),
            TextField(
              controller: txtPrice,
              decoration: InputDecoration(labelText: "Price"),
            ),
            ElevatedButton(
              child: Text("Save"),
              onPressed: () {
                save();
              },
            )
          ],
        ),
      ),
    );
  }

  void save() async {
    int? result = await dbHelper.insert(Product(
        txtName.text, txtDescription.text, double.parse(txtPrice.text)));
    if (result != 0) {
      Navigator.pop(context, true);
    }
  }
}
