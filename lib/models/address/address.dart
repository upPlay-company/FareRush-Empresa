
import 'package:farerush_empresa/models/address/city.dart';
import 'package:farerush_empresa/models/address/uf.dart';

class Address {

  Address({this.district, this.zipCode, this.city, this.state, this.lat, this.long, this.cidade, this.uf, this.logradouro});

  String district;
  String zipCode;
  String city;
  String state;
  double lat;
  double long;
  String logradouro;
  int number;
  String complement;

  UF uf;
  City cidade;

  Address.fromMap(Map<String, dynamic> map){
    district = map['district'] as String;
    zipCode = map['zipCode'] as String;
    city = map['city'];
    state = map['state'];
    lat = map['lat'] as double;
    long = map['long'] as double;
    logradouro = map['logradouro'] as String;
  }

  Map<String, dynamic> toMap() {
    return {
      'district': district,
      'zipCode': zipCode,
      'city': city,
      'state': state,
      'lat': lat,
      'long': long,
      'logradouro': logradouro
    };
  }

  @override
  String toString() {
    return 'Address{district: $district, zipCode: $zipCode, city: $city, state: $state, lat: $lat, long: $long, logradouro: $logradouro, uf: $uf, cidade: $cidade}';
  }
}