import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farerush_empresa/models/product/Product.dart';
import 'package:farerush_empresa/store/user_manager_store.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

class ProductRepository {
  final UserManagerStore _user = GetIt.I.get<UserManagerStore>();
  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseStorage _storage = FirebaseStorage.instance;
  Future save({Product product}) async {
    String _companyId = _user.user.company.id;
    File _image = File(product.images[0]);
    String _baseName = basename(product.images[0]);
    TaskSnapshot taskSnapshot = await _storage
        .ref()
        .child('partner_companies/$_companyId/products/$_baseName')
        .putFile(_image);

    taskSnapshot.ref.getDownloadURL().then((value) {
      product.urlImages.add(value);

      _db
          .collection('partner_companies')
          .doc(_companyId)
          .collection('products')
          .add(product.toMap())
          .then((value) => print('produto salvo'));
    });
  }
}
