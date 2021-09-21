class Product {
  int _id = 0;
  String _name = "";
  String _description = "";
  double _price = 0.0;

  Product(this._name, this._description, this._price);
  Product.withId(this._id, this._name, this._description, this._price);

  int get id => _id;
  String get name => _name;
  String get description => _description;
  double get price => _price;

  set name(String value) {
    if (value.length >= 2) {
      _name = value;
    }
  }

  set description(String value) {
    if (value.length >= 10) {
      _description = value;
    }
  }

  set price(double value) => value;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = _name;
    map["description"] = _description;
    map["price"] = _price;
    map["id"] = _id;

    return map;
  }

  Map<String, dynamic> toMapForAdd() {
    var map = Map<String, dynamic>();
    map["name"] = _name;
    map["description"] = _description;
    map["price"] = _price;
    //map["id"] = _id;

    return map;
  }

  Product.fromObject(dynamic o) {
    this._id = o["Id"];
    this._name = o["Name"];
    this._description = o["Description"];
    this._price = double.parse(o["Price"].toString());
  }
}
