import 'package:dio/dio.dart';
import 'package:farerush_empresa/models/address/address.dart';
import 'package:farerush_empresa/models/address/city.dart';
import 'package:farerush_empresa/repositorys/ibge_repository.dart';

class CepRepository {
  Future<Address> getAddressFromApi(String cep) async {
    if (cep == null || cep.isEmpty) return Future.error('CEP Inválido');

    final clearCep = cep.replaceAll(RegExp('[^0-9]'), '');
    if (clearCep.length != 8) return Future.error('CEP Inválido');

    final endpoint = 'https://viacep.com.br/ws/$clearCep/json';

    try {
      final response = await Dio().get<Map>(endpoint);

      if (response.data.containsKey('erro') && response.data['erro'])
        return Future.error('CEP Inválido');

      final ufList = await IBGERepository().getUFList();

      return Address(
        zipCode: response.data['cep'],
        district: response.data['bairro'],
        logradouro: response.data['logradouro'],
        cidade: City(name: response.data['localidade']),
        uf: ufList.firstWhere((uf) => uf.initials == response.data['uf']),
      );
    } catch (e) {
      return Future.error('Falha ao buscar CEP');
    }
  }
}