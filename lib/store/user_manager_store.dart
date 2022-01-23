import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farerush_empresa/models/company/company.dart';
import 'package:farerush_empresa/models/users/user.dart';
import 'package:farerush_empresa/repositorys/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'user_manager_store.g.dart';

class UserManagerStore = _UserManagerStore with _$UserManagerStore;

abstract class _UserManagerStore with Store {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  _UserManagerStore() {
    _loadCurrentUser();
    _getCompanyId();
  }

  @observable
  UserUser user;

  @observable
  String companyId;

  @action
  void setUser(UserUser value) => user = value;

  @computed
  bool get isLoggedIn => user != null;

  Future<void> _loadCurrentUser({User firebaseUser}) async {
    final User currentUser = firebaseUser ?? auth.currentUser;
    if (currentUser != null) {
      final DocumentSnapshot docUser = await firestore
          .collection('users_company')
          .doc(currentUser.uid)
          .get();
      user = UserUser.fromDocument(docUser);

      user.saveToken();
      setUser(user);
    }
  }

  _getCompanyId() async {
    QuerySnapshot result = await firestore
        .collection('approved_company')
        .where('id_user', isEqualTo: auth.currentUser.uid)
        .limit(1)
        .get();

    companyId = result.docs[0].id;
  }

  Future<void> logout() async {
    UserRepository().signOut();
    setUser(null);
  }
}
