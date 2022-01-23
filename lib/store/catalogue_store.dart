import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farerush_empresa/models/product/Product.dart';
import 'package:farerush_empresa/repositorys/catalogue_repository.dart';
import 'package:mobx/mobx.dart';
part 'catalogue_store.g.dart';

class CatalogueStore = _CatalogueStore with _$CatalogueStore;

abstract class _CatalogueStore with Store {
  CatalogueRepository _catalogueRepository = CatalogueRepository();

  @observable
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  @action
  setLoad({bool load}) {
    _isLoading = load;
  }

  @observable
  ObservableList<Product> _catalogue = ObservableList();

  ObservableList<Product> get catalogue => _catalogue;

  _CatalogueStore() {
    index();
  }

  @action
  index() async {
    _isLoading = true;
    QuerySnapshot result = await _catalogueRepository.index();
    result.docs.forEach((element) {
      Product prod = Product.fromDocument(document: element);
      catalogue.add(prod);
    });

    _isLoading = false;
  }

  @action
  add({Product product}) {
    //adicionar o produto
  }

  @action
  update({Product product}) {
    //atualizar
  }
  @action
  delete({Product product, int index}) async {
    _isLoading = true;
    //deletar
    String id = product.id;
    await _catalogueRepository
        .delete(productId: product.id, images: product.images)
        .then((value) {
      if (value == true) {
        catalogue.removeWhere((element) => element.id == id);
      }
    });

    _isLoading = false;
  }
}
