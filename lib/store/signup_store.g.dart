// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpStore on _SignUpStore, Store {
  Computed<bool> _$nameUserValidComputed;

  @override
  bool get nameUserValid =>
      (_$nameUserValidComputed ??= Computed<bool>(() => super.nameUserValid,
              name: '_SignUpStore.nameUserValid'))
          .value;
  Computed<bool> _$userNameValidComputed;

  @override
  bool get userNameValid =>
      (_$userNameValidComputed ??= Computed<bool>(() => super.userNameValid,
              name: '_SignUpStore.userNameValid'))
          .value;
  Computed<bool> _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_SignUpStore.emailValid'))
          .value;
  Computed<bool> _$phoneValidComputed;

  @override
  bool get phoneValid =>
      (_$phoneValidComputed ??= Computed<bool>(() => super.phoneValid,
              name: '_SignUpStore.phoneValid'))
          .value;
  Computed<bool> _$pass1ValidComputed;

  @override
  bool get pass1Valid =>
      (_$pass1ValidComputed ??= Computed<bool>(() => super.pass1Valid,
              name: '_SignUpStore.pass1Valid'))
          .value;
  Computed<bool> _$pass2ValidComputed;

  @override
  bool get pass2Valid =>
      (_$pass2ValidComputed ??= Computed<bool>(() => super.pass2Valid,
              name: '_SignUpStore.pass2Valid'))
          .value;
  Computed<bool> _$termosValidComputed;

  @override
  bool get termosValid =>
      (_$termosValidComputed ??= Computed<bool>(() => super.termosValid,
              name: '_SignUpStore.termosValid'))
          .value;
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignUpStore.isFormValid'))
          .value;
  Computed<Function> _$signUpPressedComputed;

  @override
  Function get signUpPressed =>
      (_$signUpPressedComputed ??= Computed<Function>(() => super.signUpPressed,
              name: '_SignUpStore.signUpPressed'))
          .value;

  final _$nameUserAtom = Atom(name: '_SignUpStore.nameUser');

  @override
  String get nameUser {
    _$nameUserAtom.reportRead();
    return super.nameUser;
  }

  @override
  set nameUser(String value) {
    _$nameUserAtom.reportWrite(value, super.nameUser, () {
      super.nameUser = value;
    });
  }

  final _$userNameAtom = Atom(name: '_SignUpStore.userName');

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  final _$emailAtom = Atom(name: '_SignUpStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$phoneAtom = Atom(name: '_SignUpStore.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$pass1Atom = Atom(name: '_SignUpStore.pass1');

  @override
  String get pass1 {
    _$pass1Atom.reportRead();
    return super.pass1;
  }

  @override
  set pass1(String value) {
    _$pass1Atom.reportWrite(value, super.pass1, () {
      super.pass1 = value;
    });
  }

  final _$pass2Atom = Atom(name: '_SignUpStore.pass2');

  @override
  String get pass2 {
    _$pass2Atom.reportRead();
    return super.pass2;
  }

  @override
  set pass2(String value) {
    _$pass2Atom.reportWrite(value, super.pass2, () {
      super.pass2 = value;
    });
  }

  final _$termosAtom = Atom(name: '_SignUpStore.termos');

  @override
  bool get termos {
    _$termosAtom.reportRead();
    return super.termos;
  }

  @override
  set termos(bool value) {
    _$termosAtom.reportWrite(value, super.termos, () {
      super.termos = value;
    });
  }

  final _$loadingAtom = Atom(name: '_SignUpStore.loading');

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

  final _$errorAtom = Atom(name: '_SignUpStore.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$_signUpAsyncAction = AsyncAction('_SignUpStore._signUp');

  @override
  Future<void> _signUp() {
    return _$_signUpAsyncAction.run(() => super._signUp());
  }

  final _$_SignUpStoreActionController = ActionController(name: '_SignUpStore');

  @override
  void setNameUser(String value) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setNameUser');
    try {
      return super.setNameUser(value);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserName(String value) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setUserName');
    try {
      return super.setUserName(value);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPass1(String value) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setPass1');
    try {
      return super.setPass1(value);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPass2(String value) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setPass2');
    try {
      return super.setPass2(value);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTermos(bool value) {
    final _$actionInfo = _$_SignUpStoreActionController.startAction(
        name: '_SignUpStore.setTermos');
    try {
      return super.setTermos(value);
    } finally {
      _$_SignUpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nameUser: ${nameUser},
userName: ${userName},
email: ${email},
phone: ${phone},
pass1: ${pass1},
pass2: ${pass2},
termos: ${termos},
loading: ${loading},
error: ${error},
nameUserValid: ${nameUserValid},
userNameValid: ${userNameValid},
emailValid: ${emailValid},
phoneValid: ${phoneValid},
pass1Valid: ${pass1Valid},
pass2Valid: ${pass2Valid},
termosValid: ${termosValid},
isFormValid: ${isFormValid},
signUpPressed: ${signUpPressed}
    ''';
  }
}
