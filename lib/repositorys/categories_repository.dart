import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farerush_empresa/models/Categorie/Categorie.dart';
import 'package:farerush_empresa/store/categorie_store.dart';
import 'package:farerush_empresa/store/user_manager_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

class CategorieRepository {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final UserManagerStore _user = GetIt.I.get<UserManagerStore>();
  final CategorieStore _categorie = GetIt.I.get<CategorieStore>();
  Future index() async {
    final DocumentSnapshot docUser =
        await _db.collection('users_company').doc(_auth.currentUser.uid).get();

    return _db
        .collection('partner_companies')
        .doc(docUser.data()['id_empresa'])
        .collection('categories')
        .orderBy('pos', descending: false)
        .get();
  }

  Future save({Categorie categorie, String companyId}) async {
    bool exist = await _exist(companyId: companyId, pos: categorie.pos);
    String result = '';
    if (exist)
      result = 'Categoria já existente nessa posição';
    else {
      await _db
          .collection('partner_companies')
          .doc(companyId)
          .collection('categories')
          .add(categorie.toMap())
          .then((value) {
        result = 'Salvo com sucesso';
      }).catchError((error) {
        return error.toString();
      });
    }

    return result;
  }

  Future _exist({String companyId, int pos}) async {
    QuerySnapshot exist = await _db
        .collection('partner_companies')
        .doc(companyId)
        .collection('categories')
        .where('pos', isEqualTo: pos)
        .get();
    if (exist.docs.length > 0) return true;
    return false;
  }

  Future update({Categorie categorie, String companyId}) async {
    print(categorie.id);
    bool exist = await _exist(companyId: companyId, pos: categorie.pos);
    String result = '';
    if (!exist)
      result = 'Categoria Não existe nessa posição';
    else {
      await _db
          .collection('partner_companies')
          .doc(companyId)
          .collection('categories')
          .doc(categorie.id)
          .update(categorie.toMap())
          .then((value) {
        result = 'Atualizado com sucesso';
      }).catchError((error) {
        return error.toString();
      });
    }

    return result;
  }

  Future delete({Categorie categorie}) async {
    return _db
        .collection('partner_companies')
        .doc(_user.user.company.id)
        .collection('categories')
        .doc(categorie.id)
        .delete();
  }
}
