import 'package:cloud_firestore/cloud_firestore.dart';

class Categorie {
  String _id;
  int _pos;
  String _name;

  Categorie({String name, int pos}) {
    this._name = name;
    this._pos = pos;
  }

  String get name => _name;

  set name(String name) {
    _name = name;
  }

  int get pos => _pos;

  set pos(int pos) {
    _pos = pos;
  }

  String get id => _id;

  set id(String id) {
    _id = id;
  }

  toMap() {
    Map<String, dynamic> categorieMap = Map();
    categorieMap = {'pos': _pos, 'name': _name};
    return categorieMap;
  }

  Categorie.fromDocument(DocumentSnapshot doc) {
    _id = doc.id;
    _name = doc.get('name') as String;
    _pos = doc.get('pos') as int;
  }

  @override
  String toString() {
    return _name;
  }
}
