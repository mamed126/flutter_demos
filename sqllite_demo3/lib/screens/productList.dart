import 'package:sqllite_demo3/helpers/db_helper.dart';
import 'package:sqllite_demo3/models/product_model.dart';
import 'package:sqllite_demo3/screens/productAdd.dart';
import 'package:sqllite_demo3/screens/productDetail.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  State<StatefulWidget> createState() => ProductListState();
}

class ProductListState extends State {
  DbHelper dbHelper = new DbHelper();
  List<Product>? products;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    if (products == null) {
      products = [];
      getData();
    }
    return Scaffold(
      body: productListItems(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToProductAdd();
        },
        tooltip: "add new product",
        child: Icon(Icons.add),
      ),
    );
  }

  ListView productListItems() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.amberAccent,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text("A"),
            ),
            title: Text(this.products![position].name),
            subtitle: Text(this.products![position].description),
            onTap: () {
              goToDetail(this.products![position]);
            },
          ),
        );
      },
    );
  }

  void getData() {
    var dbFuture = dbHelper.initializeDb();
    dbFuture.then((result) {
      var productsFuture = dbHelper.getProducts();
      productsFuture.then((data) {
        List<Product> productsData = [];
        count = data!.length;
        for (int i = 0; i < count; i++) {
          productsData.add(Product.fromObject(data[i]));
        }
        setState(() {
          products = productsData;
          count = count;
        });
      });
    });
  }

  void goToDetail(Product product) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductDetail(product)));
    getData();
  }

  void goToProductAdd() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProductAdd()));
    getData();
  }
}
