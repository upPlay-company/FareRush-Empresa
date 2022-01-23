import 'package:farerush_empresa/models/Categorie/Categorie.dart';
import 'package:farerush_empresa/models/product/adittional/Additional.dart';
import 'package:mobx/mobx.dart';
part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {
  @observable
  ObservableList<String> images = ObservableList();

  @observable
  String _title;

  String get title => _title;

  @action
  setTitle(String title) {
    _title = title;
  }

  @observable
  String _description;

  String get description => _description;

  @action
  setDescription(String description) {
    _description = description;
  }

  @observable
  int _quant;

  int get quant => _quant;

  @action
  setQuant(int quant) {
    _quant = quant;
  }

  @observable
  double _price;

  double get price => _price;

  @action
  setPrice(double price) {
    _price = price;
  }

  @observable
  Categorie _categorie;

  Categorie get categorie => _categorie;

  @action
  setCategorie(Categorie categorie) {
    _categorie = categorie;
  }

  @observable
  bool _hasAdditional = false;

  bool get hasAdditional => _hasAdditional;

  @action
  setHasAdditional(bool hasAdditional) {
    _hasAdditional = hasAdditional;
    if (_hasAdditional == false) {
      additionals.clear();
    }
  }

  @observable
  ObservableList<Additional> additionals = ObservableList();
}
