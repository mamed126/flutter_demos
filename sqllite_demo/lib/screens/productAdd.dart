import 'package:sqllite_demo/helpers/db_helper.dart';
import 'package:sqllite_demo/models/product.dart';
import 'package:flutter/material.dart';

class ProductAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductAddState();
}

class ProductAddState extends State {
  DbHelper dbHelper = new DbHelper();

  TextEditingController txtName = new TextEditingController();

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
    int result = await dbHelper.insert(Product(id:0,
        name:txtName.text));
    if (result != 0) {
      Navigator.pop(context, true);
    }
  }
}
