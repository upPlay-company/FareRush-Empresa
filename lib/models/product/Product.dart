import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farerush_empresa/models/Categorie/Categorie.dart';
import 'package:farerush_empresa/models/product/adittional/Additional.dart';

class Product {
  String _id;

  String get id => _id;

  set id(String id) {
    _id = id;
  }

  String _title;

  String get title => _title;

  set title(String title) {
    _title = title;
  }

  String _categorieName;

  String get categorieName => _categorieName;

  set categorieName(String categorieName) {
    _categorieName = categorieName;
  }

  String _description;

  String get description => _description;

  set description(String description) {
    _description = description;
  }

  int _quant;

  int get quant => _quant;

  set quant(int quant) {
    _quant = quant;
  }

  double _price;

  double get price => _price;

  set price(double price) {
    _price = price;
  }

  Categorie _categorie;

  Categorie get categorie => _categorie;

  set categorie(Categorie categorie) {
    _categorie = categorie;
  }

  List<Additional> _additionals = [];

  List<Additional> get additionals => _additionals;

  set additionals(List<Additional> additionals) {
    _additionals = additionals;
  }

  List<dynamic> _images;

  List<dynamic> get images => _images;

  set images(List<dynamic> images) {
    _images = images;
  }

  List<String> _urlImages = [];

  List<String> get urlImages => _urlImages;

  set urlImages(List<String> urlImages) {
    _urlImages = urlImages;
  }

  Product(
      {String title,
      String description,
      int quant,
      double price,
      Categorie categorie,
      List<Additional> additionals,
      List<String> images}) {
    this._title = title;
    this._description = description;
    this._quant = quant;
    this._price = price;
    this._categorie = categorie;
    this._additionals = additionals;
    this._images = images;
  }

  toMap() {
    return {
      'title': _title,
      'description': _description,
      'quant': _quant,
      'price': _price,
      'categorie': _categorie.id,
      'categorieName': _categorie.name,
      'additionals': additionalMap(),
      'images': _urlImages
    };
  }

  Product.fromDocument({DocumentSnapshot document}) {
    this._id = document.id;
    this._title = document.data()['title'];
    this._description = document.data()['description'];
    this._quant = document.data()['quant'];
    this._price = document.data()['price'];
    this._categorieName = document.data()['categorieName'];
    for (var item in document.data()['additionals']) {
      Additional _additional = Additional(item['name'], item['price']);
      additionals.add(_additional);
    }
    this._images = document.data()['images'];
  }

  additionalMap() {
    List<Map> _additionalsMap = [];
    _additionals.forEach((element) {
      _additionalsMap.add(element.toMap());
    });

    return _additionalsMap;
  }
}
