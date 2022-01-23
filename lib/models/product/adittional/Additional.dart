class Additional {
  String _name;
  String _price;

  Additional(String name, String price) {
    this._name = name;
    this._price = price;
  }

  String get name => _name;

  set name(String name) {
    _name = name;
  }

  String get price => _price;

  set price(String price) {
    _price = price;
  }

  toMap() {
    return {'name': _name, 'price': _price};
  }
}
