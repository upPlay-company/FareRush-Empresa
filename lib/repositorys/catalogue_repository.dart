import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farerush_empresa/store/user_manager_store.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

class CatalogueRepository {
  final UserManagerStore _user = GetIt.I.get<UserManagerStore>();
  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;
  Future index() {
    String companyId = _user.user.company.id;

    return _db
        .collection('partner_companies')
        .doc(companyId)
        .collection('products')
        .get();
  }

  Future delete({String productId, List images}) async {
    String companyId = _user.user.company.id;

    bool deleted = await deleteImages(images: images);

    if (!deleted) return false;

    await _db
        .collection('partner_companies')
        .doc(companyId)
        .collection('products')
        .doc(productId)
        .delete()
        .then((value) {
      deleted = true;
    }).catchError((error) {
      deleted = false;
    });

    return deleted;
  }

  deleteImages({List images}) async {
    images.forEach((element) {
      _storage.refFromURL(element).delete().catchError((error) {
        return false;
      });
    });
    return true;
  }
}
