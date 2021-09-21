class Product {
  int id = 0;
  String name = "";
  Product({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();

    map["id"] = id;
    map["name"] = name;

    return map;
  }

  Product.fromObj(dynamic o) {
    this.id = o["id"];
  }
}
