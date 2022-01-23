// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalogue_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CatalogueStore on _CatalogueStore, Store {
  final _$_isLoadingAtom = Atom(name: '_CatalogueStore._isLoading');

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  final _$_catalogueAtom = Atom(name: '_CatalogueStore._catalogue');

  @override
  ObservableList<Product> get _catalogue {
    _$_catalogueAtom.reportRead();
    return super._catalogue;
  }

  @override
  set _catalogue(ObservableList<Product> value) {
    _$_catalogueAtom.reportWrite(value, super._catalogue, () {
      super._catalogue = value;
    });
  }

  final _$indexAsyncAction = AsyncAction('_CatalogueStore.index');

  @override
  Future index() {
    return _$indexAsyncAction.run(() => super.index());
  }

  final _$deleteAsyncAction = AsyncAction('_CatalogueStore.delete');

  @override
  Future delete({Product product, int index}) {
    return _$deleteAsyncAction
        .run(() => super.delete(product: product, index: index));
  }

  final _$_CatalogueStoreActionController =
      ActionController(name: '_CatalogueStore');

  @override
  dynamic setLoad({bool load}) {
    final _$actionInfo = _$_CatalogueStoreActionController.startAction(
        name: '_CatalogueStore.setLoad');
    try {
      return super.setLoad(load: load);
    } finally {
      _$_CatalogueStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic add({Product product}) {
    final _$actionInfo = _$_CatalogueStoreActionController.startAction(
        name: '_CatalogueStore.add');
    try {
      return super.add(product: product);
    } finally {
      _$_CatalogueStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic update({Product product}) {
    final _$actionInfo = _$_CatalogueStoreActionController.startAction(
        name: '_CatalogueStore.update');
    try {
      return super.update(product: product);
    } finally {
      _$_CatalogueStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
