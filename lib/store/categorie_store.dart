import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farerush_empresa/models/Categorie/Categorie.dart';
import 'package:farerush_empresa/repositorys/categories_repository.dart';
import 'package:mobx/mobx.dart';
part 'categorie_store.g.dart';

class CategorieStore = _CategorieStore with _$CategorieStore;

abstract class _CategorieStore with Store {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  _CategorieStore() {
    _getCategories();
  }

  @observable
  ObservableList<Categorie> allDocs = ObservableList<Categorie>();

  @observable
  bool loading;

  @action
  setLoad(bool load) {
    this.loading = load;
  }

  @action
  void reload() {
    _getCategories();
  }

  Future<void> _getCategories() async {
    setLoad(true);
    CategorieRepository _categorieRepository = CategorieRepository();
    /*final QuerySnapshot snapCategorie =
        await firestore.collection('categories').get();*/
    final QuerySnapshot snapshotCategories = await _categorieRepository.index();
    //.orderBy('created', descending: true)
    allDocs.clear();
    allDocs.addAll(
        snapshotCategories.docs.map((a) => Categorie.fromDocument(a)).toList());
    setLoad(false);
  }
}
