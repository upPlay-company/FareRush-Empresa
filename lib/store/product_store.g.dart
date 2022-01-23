// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductStore on _ProductStore, Store {
  final _$imagesAtom = Atom(name: '_ProductStore.images');

  @override
  ObservableList<String> get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(ObservableList<String> value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  final _$_titleAtom = Atom(name: '_ProductStore._title');

  @override
  String get _title {
    _$_titleAtom.reportRead();
    return super._title;
  }

  @override
  set _title(String value) {
    _$_titleAtom.reportWrite(value, super._title, () {
      super._title = value;
    });
  }

  final _$_descriptionAtom = Atom(name: '_ProductStore._description');

  @override
  String get _description {
    _$_descriptionAtom.reportRead();
    return super._description;
  }

  @override
  set _description(String value) {
    _$_descriptionAtom.reportWrite(value, super._description, () {
      super._description = value;
    });
  }

  final _$_quantAtom = Atom(name: '_ProductStore._quant');

  @override
  int get _quant {
    _$_quantAtom.reportRead();
    return super._quant;
  }

  @override
  set _quant(int value) {
    _$_quantAtom.reportWrite(value, super._quant, () {
      super._quant = value;
    });
  }

  final _$_priceAtom = Atom(name: '_ProductStore._price');

  @override
  double get _price {
    _$_priceAtom.reportRead();
    return super._price;
  }

  @override
  set _price(double value) {
    _$_priceAtom.reportWrite(value, super._price, () {
      super._price = value;
    });
  }

  final _$_categorieAtom = Atom(name: '_ProductStore._categorie');

  @override
  Categorie get _categorie {
    _$_categorieAtom.reportRead();
    return super._categorie;
  }

  @override
  set _categorie(Categorie value) {
    _$_categorieAtom.reportWrite(value, super._categorie, () {
      super._categorie = value;
    });
  }

  final _$_hasAdditionalAtom = Atom(name: '_ProductStore._hasAdditional');

  @override
  bool get _hasAdditional {
    _$_hasAdditionalAtom.reportRead();
    return super._hasAdditional;
  }

  @override
  set _hasAdditional(bool value) {
    _$_hasAdditionalAtom.reportWrite(value, super._hasAdditional, () {
      super._hasAdditional = value;
    });
  }

  final _$additionalsAtom = Atom(name: '_ProductStore.additionals');

  @override
  ObservableList<Additional> get additionals {
    _$additionalsAtom.reportRead();
    return super.additionals;
  }

  @override
  set additionals(ObservableList<Additional> value) {
    _$additionalsAtom.reportWrite(value, super.additionals, () {
      super.additionals = value;
    });
  }

  final _$_ProductStoreActionController =
      ActionController(name: '_ProductStore');

  @override
  dynamic setTitle(String title) {
    final _$actionInfo = _$_ProductStoreActionController.startAction(
        name: '_ProductStore.setTitle');
    try {
      return super.setTitle(title);
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescription(String description) {
    final _$actionInfo = _$_ProductStoreActionController.startAction(
        name: '_ProductStore.setDescription');
    try {
      return super.setDescription(description);
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQuant(int quant) {
    final _$actionInfo = _$_ProductStoreActionController.startAction(
        name: '_ProductStore.setQuant');
    try {
      return super.setQuant(quant);
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPrice(double price) {
    final _$actionInfo = _$_ProductStoreActionController.startAction(
        name: '_ProductStore.setPrice');
    try {
      return super.setPrice(price);
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCategorie(Categorie categorie) {
    final _$actionInfo = _$_ProductStoreActionController.startAction(
        name: '_ProductStore.setCategorie');
    try {
      return super.setCategorie(categorie);
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHasAdditional(bool hasAdditional) {
    final _$actionInfo = _$_ProductStoreActionController.startAction(
        name: '_ProductStore.setHasAdditional');
    try {
      return super.setHasAdditional(hasAdditional);
    } finally {
      _$_ProductStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
images: ${images},
additionals: ${additionals}
    ''';
  }
}
