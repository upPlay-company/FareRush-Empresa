import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:farerush_empresa/commons/easy_loading.dart';
import 'package:farerush_empresa/models/address/address.dart';
import 'package:farerush_empresa/models/company/company.dart';
import 'package:farerush_empresa/store/cep_store.dart';
import 'package:farerush_empresa/store/user_manager_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'new_company_store.g.dart';

class NewCompanyStore = _NewCompanyStore with _$NewCompanyStore;

abstract class _NewCompanyStore with Store {

  _NewCompanyStore({this.empresa}) {
    if(empresa.imgPerfil != null)
      imgPerfil = empresa.imgPerfil.asObservable();
    if(empresa.imgCapa != null)
      imgCapa = empresa.imgCapa.asObservable();
    cnpj = empresa.cnpj ?? '';
    razaoSocial = empresa.razaoSocial ?? '';
    nome = empresa.nomeLoja ?? '';
    numero = empresa.phone ?? '';

    serviceEntrega = empresa.serviceEntrega;
    numberEndereco = empresa.number?.toStringAsFixed(0) ?? '';
    complementEndereco = empresa.complement ?? '';
    tempoPreparo = empresa.tempoEntrega ?? '';

    if (empresa.address != null)
      cepStore = CepStore(empresa.address.zipCode);
    else
      cepStore = CepStore(null);
  }

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  final Company empresa;

  ObservableList imgPerfil = ObservableList();

  @computed
  bool get imgPerfilValid => imgPerfil.isNotEmpty;
  String get imgPerfilError {
    if (!showErrors || imgPerfilValid)
      return null;
    else
      return 'Insira uma imagem de perfil';
  }

  ObservableList imgCapa = ObservableList();

  @computed
  bool get imgCapaValid => imgCapa.isNotEmpty;
  String get imgCapaError {
    if (!showErrors || imgCapaValid)
      return null;
    else
      return 'Insira uma imagem de capa';
  }

  @observable
  String cnpj = '';

  @action
  void setCnpj(String value) => cnpj = value;

  @computed

  bool get cnpjValid => cnpj.length >= 14;
  String get cnpjError {
    if (!showErrors || cnpjValid && CNPJValidator.isValid(cnpj))
      return null;
    else if (cnpj.isEmpty)
      return 'Campo obrigatório';
    else
      return 'CPNJ inválido';
  }

  @observable
  String razaoSocial = '';

  @action
  void setRazaoSocial(String value) => razaoSocial = value;

  @computed
  bool get razaoSocialValid => razaoSocial.length >= 1;
  String get razaoSocialError {
    if (!showErrors || razaoSocialValid)
      return null;
    else if (razaoSocial.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Escreva a razão social da sua loja';
  }

  @observable
  String nome = '';

  @action
  void setNome(String value) => nome = value;

  @computed
  bool get nomeValid => nome.length >= 5;
  String get nomeError {
    if (!showErrors || nomeValid)
      return null;
    else if (nome.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Escreva o nome da sua loja';
  }

  @observable
  String numero = '';

  @action
  void setNumero(String value) => numero = value;

  @computed
  bool get numeroValid => numero.length >= 11;
  String get numeroError {
    if (!showErrors || numeroValid)
      return null;
    else if (numero.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Número inválido';
  }

  @observable
  bool serviceEntrega;

  @action
  void setServiceEntrega(bool value) => serviceEntrega = value;

  CepStore cepStore;

  @computed
  Address get address => cepStore.address;
  bool get addressValid => address != null;
  // ignore: missing_return
  String get addressError {
    if (!showErrors || addressValid)
      return null;
  }

  @observable
  String numberEndereco = '';

  @action
  void setNumberEndereco(String value) => numberEndereco = value;

  @computed
  num get number {
    return num.tryParse(numberEndereco);
  }

  bool get numberValid => number != null && number <= 9999999999999;
  String get numberError {
    if (!showErrors || numberValid)
      return null;
    else if (numberEndereco.isEmpty)
      return 'Campo obrigatório';
    else
      return '';
  }

  @observable
  String complementEndereco = '';

  @action
  void setComplementEndereco(String value) => complementEndereco = value;

  @observable
  String tempoPreparo = '';

  @action
  void setTempoPreparo(String value) => tempoPreparo = value;

  @computed
  bool get tempoPreparoValid => tempoPreparo != null;
  String get tempoPreparoError {
    if (!showErrors || tempoPreparoValid)
      return null;
    else if (tempoPreparo.isEmpty)
      return 'Campo obrigatório';
    else
      return '';
  }

  @computed
  bool get formValid =>
          cnpjValid &&
          razaoSocialValid &&
          nomeValid &&
          numeroValid &&
          numeroValid &&
          imgPerfilValid &&
          imgCapaValid &&
          tempoPreparoValid;

  @computed
  Function get sendPressed => formValid ? _send : null;

  @observable
  bool showErrors = false;

  @action
  void invalidSendPressed() => showErrors = true;

  @observable
  bool loading = false;

  @observable
  String error;

  @observable
  bool savedEmp = false;

  @action
  Future<void> _send() async {
    empresa.imgCapa = imgCapa;
    empresa.imgPerfil = imgPerfil;
    empresa.cnpj = cnpj;
    empresa.razaoSocial = razaoSocial;
    empresa.nomeLoja = nome;
    empresa.phone = numero;
    empresa.serviceEntrega = serviceEntrega;
    empresa.address = address;
    empresa.number = number;
    empresa.complement = complementEndereco;
    empresa.user = GetIt.I<UserManagerStore>().user;
    empresa.tempoEntrega = tempoPreparo;

    loading = true;
    try {
      await Company().save(empresa);
      savedEmp = true;
    } catch (e){
      print(e);
    }
    dismiss();
    loading = false;
  }

}