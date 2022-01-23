// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategorieStore on _CategorieStore, Store {
  final _$allDocsAtom = Atom(name: '_CategorieStore.allDocs');

  @override
  ObservableList<Categorie> get allDocs {
    _$allDocsAtom.reportRead();
    return super.allDocs;
  }

  @override
  set allDocs(ObservableList<Categorie> value) {
    _$allDocsAtom.reportWrite(value, super.allDocs, () {
      super.allDocs = value;
    });
  }

  final _$loadingAtom = Atom(name: '_CategorieStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$_CategorieStoreActionController =
      ActionController(name: '_CategorieStore');

  @override
  dynamic setLoad(bool load) {
    final _$actionInfo = _$_CategorieStoreActionController.startAction(
        name: '_CategorieStore.setLoad');
    try {
      return super.setLoad(load);
    } finally {
      _$_CategorieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reload() {
    final _$actionInfo = _$_CategorieStoreActionController.startAction(
        name: '_CategorieStore.reload');
    try {
      return super.reload();
    } finally {
      _$_CategorieStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allDocs: ${allDocs},
loading: ${loading}
    ''';
  }
}
