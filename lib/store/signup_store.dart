import 'package:farerush_empresa/commons/easy_loading.dart';
import 'package:farerush_empresa/helpers/firebase.error.dart';
import 'package:farerush_empresa/models/users/user.dart';
import 'package:farerush_empresa/repositorys/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:farerush_empresa/helpers/extensions.dart';
import 'package:mobx/mobx.dart';

part 'signup_store.g.dart';

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {

  @observable
  String nameUser;

  @action
  void setNameUser(String value) => nameUser = value;

  @computed
  bool get nameUserValid => nameUser != null && nameUser.length > 10;
  String get nameUserError {
    if(nameUser == null || nameUserValid)
      return null;
    else if(nameUser.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Preencha seu nome completo';
  }

  @observable
  String userName;

  @action
  void setUserName(String value) => userName = value;

  @computed
  bool get userNameValid => userName != null && userName.length > 4;
  String get userNameError {
    if(userName == null || userNameValid)
      return null;
    else if(userName.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Preencha somente com um nome';
  }

  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError {
    if(email == null || emailValid)
      return null;
    else if(email.isEmpty)
      return 'Campo obrigatório';
    else
      return 'E-mail inválido';
  }

  @observable
  String phone;

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone.length >= 14;
  String get phoneError {
    if (phone == null || phoneValid)
      return null;
    else if (phone.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Celular inválido';
  }

  @observable
  String pass1;

  @action
  void setPass1(String value) => pass1 = value;

  @computed
  bool get pass1Valid => pass1 != null && pass1.length >= 6;
  String get pass1Error {
    if (pass1 == null || pass1Valid)
      return null;
    else if (pass1.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Senha muito curta';
  }

  @observable
  String pass2;

  @action
  void setPass2(String value) => pass2 = value;

  @computed
  bool get pass2Valid => pass2 != null && pass2 == pass1;
  String get pass2Error {
    if (pass2 == null || pass2Valid)
      return null;
    else
      return 'Senhas não coincidem';
  }

  @observable
  bool termos = false;

  @action
  void setTermos(bool value) => termos = value;

  @computed
  bool get termosValid => termos != null && termos == true;
  String get termosError {
    if(termos == null || termosValid)
      return null;
    else
      return 'Campo obrigatório';
  }

  @computed
  bool get isFormValid => nameUserValid && userNameValid && emailValid
      && phoneValid && pass1Valid && pass2Valid && termosValid;

  @computed
  Function get signUpPressed => (isFormValid && !loading) ? _signUp : null;

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  Future<void> _signUp() async {
    loading = true;
    easyLoading();

    final user = UserUser(
      nameUser: nameUser,
      apelido: userName,
      email: email,
      phone: phone,
      pass: pass1,
      termos: termos,
      approved: false,
    );

    try {
      await UserRepository().signUp(user);
    } on FirebaseAuthException catch (e) {
      error = getErrorString(e.code);
    }
    loading = false;
  }

}