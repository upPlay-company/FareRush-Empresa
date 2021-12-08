// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_company_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewCompanyStore on _NewCompanyStore, Store {
  Computed<bool> _$imgPerfilValidComputed;

  @override
  bool get imgPerfilValid =>
      (_$imgPerfilValidComputed ??= Computed<bool>(() => super.imgPerfilValid,
              name: '_NewCompanyStore.imgPerfilValid'))
          .value;
  Computed<bool> _$imgCapaValidComputed;

  @override
  bool get imgCapaValid =>
      (_$imgCapaValidComputed ??= Computed<bool>(() => super.imgCapaValid,
              name: '_NewCompanyStore.imgCapaValid'))
          .value;
  Computed<bool> _$cnpjValidComputed;

  @override
  bool get cnpjValid =>
      (_$cnpjValidComputed ??= Computed<bool>(() => super.cnpjValid,
              name: '_NewCompanyStore.cnpjValid'))
          .value;
  Computed<bool> _$razaoSocialValidComputed;

  @override
  bool get razaoSocialValid => (_$razaoSocialValidComputed ??= Computed<bool>(
          () => super.razaoSocialValid,
          name: '_NewCompanyStore.razaoSocialValid'))
      .value;
  Computed<bool> _$nomeValidComputed;

  @override
  bool get nomeValid =>
      (_$nomeValidComputed ??= Computed<bool>(() => super.nomeValid,
              name: '_NewCompanyStore.nomeValid'))
          .value;
  Computed<bool> _$numeroValidComputed;

  @override
  bool get numeroValid =>
      (_$numeroValidComputed ??= Computed<bool>(() => super.numeroValid,
              name: '_NewCompanyStore.numeroValid'))
          .value;
  Computed<Address> _$addressComputed;

  @override
  Address get address =>
      (_$addressComputed ??= Computed<Address>(() => super.address,
              name: '_NewCompanyStore.address'))
          .value;
  Computed<num> _$numberComputed;

  @override
  num get number => (_$numberComputed ??=
          Computed<num>(() => super.number, name: '_NewCompanyStore.number'))
      .value;
  Computed<bool> _$tempoPreparoValidComputed;

  @override
  bool get tempoPreparoValid => (_$tempoPreparoValidComputed ??= Computed<bool>(
          () => super.tempoPreparoValid,
          name: '_NewCompanyStore.tempoPreparoValid'))
      .value;
  Computed<bool> _$formValidComputed;

  @override
  bool get formValid =>
      (_$formValidComputed ??= Computed<bool>(() => super.formValid,
              name: '_NewCompanyStore.formValid'))
          .value;
  Computed<Function> _$sendPressedComputed;

  @override
  Function get sendPressed =>
      (_$sendPressedComputed ??= Computed<Function>(() => super.sendPressed,
              name: '_NewCompanyStore.sendPressed'))
          .value;

  final _$cnpjAtom = Atom(name: '_NewCompanyStore.cnpj');

  @override
  String get cnpj {
    _$cnpjAtom.reportRead();
    return super.cnpj;
  }

  @override
  set cnpj(String value) {
    _$cnpjAtom.reportWrite(value, super.cnpj, () {
      super.cnpj = value;
    });
  }

  final _$razaoSocialAtom = Atom(name: '_NewCompanyStore.razaoSocial');

  @override
  String get razaoSocial {
    _$razaoSocialAtom.reportRead();
    return super.razaoSocial;
  }

  @override
  set razaoSocial(String value) {
    _$razaoSocialAtom.reportWrite(value, super.razaoSocial, () {
      super.razaoSocial = value;
    });
  }

  final _$nomeAtom = Atom(name: '_NewCompanyStore.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$numeroAtom = Atom(name: '_NewCompanyStore.numero');

  @override
  String get numero {
    _$numeroAtom.reportRead();
    return super.numero;
  }

  @override
  set numero(String value) {
    _$numeroAtom.reportWrite(value, super.numero, () {
      super.numero = value;
    });
  }

  final _$serviceEntregaAtom = Atom(name: '_NewCompanyStore.serviceEntrega');

  @override
  bool get serviceEntrega {
    _$serviceEntregaAtom.reportRead();
    return super.serviceEntrega;
  }

  @override
  set serviceEntrega(bool value) {
    _$serviceEntregaAtom.reportWrite(value, super.serviceEntrega, () {
      super.serviceEntrega = value;
    });
  }

  final _$numberEnderecoAtom = Atom(name: '_NewCompanyStore.numberEndereco');

  @override
  String get numberEndereco {
    _$numberEnderecoAtom.reportRead();
    return super.numberEndereco;
  }

  @override
  set numberEndereco(String value) {
    _$numberEnderecoAtom.reportWrite(value, super.numberEndereco, () {
      super.numberEndereco = value;
    });
  }

  final _$complementEnderecoAtom =
      Atom(name: '_NewCompanyStore.complementEndereco');

  @override
  String get complementEndereco {
    _$complementEnderecoAtom.reportRead();
    return super.complementEndereco;
  }

  @override
  set complementEndereco(String value) {
    _$complementEnderecoAtom.reportWrite(value, super.complementEndereco, () {
      super.complementEndereco = value;
    });
  }

  final _$tempoPreparoAtom = Atom(name: '_NewCompanyStore.tempoPreparo');

  @override
  String get tempoPreparo {
    _$tempoPreparoAtom.reportRead();
    return super.tempoPreparo;
  }

  @override
  set tempoPreparo(String value) {
    _$tempoPreparoAtom.reportWrite(value, super.tempoPreparo, () {
      super.tempoPreparo = value;
    });
  }

  final _$showErrorsAtom = Atom(name: '_NewCompanyStore.showErrors');

  @override
  bool get showErrors {
    _$showErrorsAtom.reportRead();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.reportWrite(value, super.showErrors, () {
      super.showErrors = value;
    });
  }

  final _$loadingAtom = Atom(name: '_NewCompanyStore.loading');

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

  final _$errorAtom = Atom(name: '_NewCompanyStore.error');

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

  final _$savedEmpAtom = Atom(name: '_NewCompanyStore.savedEmp');

  @override
  bool get savedEmp {
    _$savedEmpAtom.reportRead();
    return super.savedEmp;
  }

  @override
  set savedEmp(bool value) {
    _$savedEmpAtom.reportWrite(value, super.savedEmp, () {
      super.savedEmp = value;
    });
  }

  final _$_sendAsyncAction = AsyncAction('_NewCompanyStore._send');

  @override
  Future<void> _send() {
    return _$_sendAsyncAction.run(() => super._send());
  }

  final _$_NewCompanyStoreActionController =
      ActionController(name: '_NewCompanyStore');

  @override
  void setCnpj(String value) {
    final _$actionInfo = _$_NewCompanyStoreActionController.startAction(
        name: '_NewCompanyStore.setCnpj');
    try {
      return super.setCnpj(value);
    } finally {
      _$_NewCompanyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRazaoSocial(String value) {
    final _$actionInfo = _$_NewCompanyStoreActionController.startAction(
        name: '_NewCompanyStore.setRazaoSocial');
    try {
      return super.setRazaoSocial(value);
    } finally {
      _$_NewCompanyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNome(String value) {
    final _$actionInfo = _$_NewCompanyStoreActionController.startAction(
        name: '_NewCompanyStore.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_NewCompanyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumero(String value) {
    final _$actionInfo = _$_NewCompanyStoreActionController.startAction(
        name: '_NewCompanyStore.setNumero');
    try {
      return super.setNumero(value);
    } finally {
      _$_NewCompanyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setServiceEntrega(bool value) {
    final _$actionInfo = _$_NewCompanyStoreActionController.startAction(
        name: '_NewCompanyStore.setServiceEntrega');
    try {
      return super.setServiceEntrega(value);
    } finally {
      _$_NewCompanyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumberEndereco(String value) {
    final _$actionInfo = _$_NewCompanyStoreActionController.startAction(
        name: '_NewCompanyStore.setNumberEndereco');
    try {
      return super.setNumberEndereco(value);
    } finally {
      _$_NewCompanyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComplementEndereco(String value) {
    final _$actionInfo = _$_NewCompanyStoreActionController.startAction(
        name: '_NewCompanyStore.setComplementEndereco');
    try {
      return super.setComplementEndereco(value);
    } finally {
      _$_NewCompanyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTempoPreparo(String value) {
    final _$actionInfo = _$_NewCompanyStoreActionController.startAction(
        name: '_NewCompanyStore.setTempoPreparo');
    try {
      return super.setTempoPreparo(value);
    } finally {
      _$_NewCompanyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$_NewCompanyStoreActionController.startAction(
        name: '_NewCompanyStore.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$_NewCompanyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cnpj: ${cnpj},
razaoSocial: ${razaoSocial},
nome: ${nome},
numero: ${numero},
serviceEntrega: ${serviceEntrega},
numberEndereco: ${numberEndereco},
complementEndereco: ${complementEndereco},
tempoPreparo: ${tempoPreparo},
showErrors: ${showErrors},
loading: ${loading},
error: ${error},
savedEmp: ${savedEmp},
imgPerfilValid: ${imgPerfilValid},
imgCapaValid: ${imgCapaValid},
cnpjValid: ${cnpjValid},
razaoSocialValid: ${razaoSocialValid},
nomeValid: ${nomeValid},
numeroValid: ${numeroValid},
address: ${address},
number: ${number},
tempoPreparoValid: ${tempoPreparoValid},
formValid: ${formValid},
sendPressed: ${sendPressed}
    ''';
  }
}
