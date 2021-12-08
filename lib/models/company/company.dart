import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farerush_empresa/models/address/address.dart';
import 'package:farerush_empresa/models/address/city.dart';
import 'package:farerush_empresa/models/address/uf.dart';
import 'package:farerush_empresa/models/users/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class Company {

  String id;
  String cnpj;
  String razaoSocial;
  String nomeLoja;
  String phone;
  Address address;
  bool serviceEntrega;
  int number;
  String complement;
  UserUser user;
  List imgCapa = [];
  List imgPerfil = [];
  String tempoEntrega;
  bool approved;

  Company({this.id,
    this.cnpj,
    this.razaoSocial,
    this.nomeLoja,
    this.phone,
    this.address,
    this.serviceEntrega,
    this.number,
    this.complement,
    this.user,
    this.imgPerfil,
    this.imgCapa,
    this.tempoEntrega,
    this.approved});

  Company.fromDocument(DocumentSnapshot document){
    id = document.id;
    cnpj = document.data()['cnpj'];
    razaoSocial = document.data()['razaoSocial'];
    nomeLoja = document.data()['nomeLoja'];
    phone = document.data()['phone'];
    address = Address(
        district: document.data()['bairro'],
        zipCode: document.data()['cep'],
        cidade: City(
            name: document.data()['cidade']
        ),
        uf: UF(
            initials: document.data()['estado']
        ),
        logradouro: document.data()['rua']
    );
    serviceEntrega = document.data()['serviceEntrega'] as bool;
    number = document.data()['numero'];
    complement = document.data()['complemento'];
    user = UserUser(
        id: document.data()['user_id'] as String
    );
    imgPerfil =
    List<String>.from(document.data()['imgPerfil'] as List<dynamic>);
    imgCapa = List<String>.from(document.data()['imgCapa'] as List<dynamic>);
    tempoEntrega = document.data()['tempoEntrega'];
    if(document.data().containsKey('aprovado')){
      approved = document.data()['aprovado'] as bool;
    }
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  Reference get storageRef =>
      storage.ref('partner_companies').child(id);


  Future<void> save(Company empresa) async {
    final Map<String, dynamic> data = {
      'cnpj': empresa.cnpj,
      'razaoSocial': empresa.razaoSocial,
      'nomeLoja': empresa.nomeLoja,
      'phone': empresa.phone,
      'cidade': empresa.address.cidade.name,
      'cep': empresa.address.zipCode,
      'bairro': empresa.address.district,
      'rua': empresa.address.logradouro,
      'estado': empresa.address.uf.initials,
      'created': FieldValue.serverTimestamp(),
      'serviceEntrega': empresa.serviceEntrega,
      'numero': empresa.number,
      'complemento': empresa.complement,
      'user': empresa.user.id,
      'tempoEntrega': empresa.tempoEntrega,
      'aprovado': false,
    };

    if (empresa.id == null) {
      final doc = await FirebaseFirestore.instance
          .collection('partner_companies')
          .add(data);

      DocumentReference firestoreRefUser = firestore
          .collection('users_company')
          .doc(empresa.user.id);

      await firestoreRefUser.update({'id_empresa': doc.id});

      final List<String> uploadImagePerfil = [];

      for (final imagePerfil in empresa.imgPerfil) {
        if (imagePerfil as File != null) {
          final UploadTask task = storageRef.child(Uuid().v1()).putFile(
              imagePerfil);
          final TaskSnapshot snapshot = await task;
          final String url = await snapshot.ref.getDownloadURL();
          uploadImagePerfil.add(url);
        }

        DocumentReference firestoreRef = firestore
            .collection('partner_companies')
            .doc(doc.id);

        await firestoreRef.update({
          'imgPerfil': uploadImagePerfil,
        });
        empresa.imgPerfil = uploadImagePerfil;
      }

      final List<String> uploadImageCapa = [];

      for (final imagemCapa in empresa.imgCapa) {
        if (imagemCapa as File != null) {
          final UploadTask task = storageRef.child(Uuid().v1()).putFile(
              imagemCapa);
          final TaskSnapshot snapshot = await task;
          final String url = await snapshot.ref.getDownloadURL();
          uploadImageCapa.add(url);
        }

        DocumentReference firestoreRef = firestore
            .collection('partner_companies')
            .doc(doc.id);

        await firestoreRef.update({
          'imgCapa': uploadImageCapa,
        });
        empresa.imgCapa = uploadImageCapa;
      }

      // solicitacao para aprovacao

      Map<String, dynamic> solicitacao = {
        'id_empresa': doc.id,
        'id_user': empresa.user.id,
        'aprovado': false,
        'created': FieldValue.serverTimestamp(),
      };

      await firestore.collection('approved_company').add(solicitacao);

    } else {

      final List<String> uploadImagePerfil = [];

      for (final imagePerfil in empresa.imgPerfil) {
        if (imagePerfil is File) {
          final UploadTask task = storageRef.child(Uuid().v1()).putFile(imagePerfil);
          final TaskSnapshot snapshot = await task;
          final String url = await snapshot.ref.getDownloadURL();
          uploadImagePerfil.add(url);
        } else if (empresa.imgPerfil.contains(imagePerfil)) {
          uploadImagePerfil.add(imagePerfil as String);
        }
      }

      for (final imagePerfil in empresa.imgPerfil) {
        if (!empresa.imgPerfil.contains(imagePerfil)) {
          try {
            final ref = storage.refFromURL(imagePerfil);
            await ref.delete();
          } catch (e) {
            debugPrint('Falha ao deletar $imagePerfil');
          }
        }
      }

      final List<String> uploadImageCapa = [];

      for (final imageCapa in empresa.imgCapa) {
        if (imageCapa is File) {
          final UploadTask task = storageRef.child(Uuid().v1()).putFile(imageCapa);
          final TaskSnapshot snapshot = await task;
          final String url = await snapshot.ref.getDownloadURL();
          uploadImageCapa.add(url);
        } else if (empresa.imgCapa.contains(imageCapa)) {
          uploadImageCapa.add(imageCapa as String);
        }
      }

      for (final imageCapa in empresa.imgCapa) {
        if (!empresa.imgCapa.contains(imageCapa)) {
          try {
            final ref = storage.refFromURL(imageCapa);
            await ref.delete();
          } catch (e) {
            debugPrint('Falha ao deletar $imageCapa');
          }
        }
      }

      DocumentReference firestoreRef = firestore
          .collection('partner_companies')
          .doc(empresa.id);

      DocumentReference firestoreRefUser = firestore
          .collection('users_company')
          .doc(empresa.user.id);

      await firestoreRef.update(data);
      await firestoreRefUser.update({'id_empresa': empresa.id});
      await firestoreRef.update({'imgPerfil': uploadImagePerfil});
      empresa.imgPerfil = uploadImagePerfil;

      await firestoreRef.update({'imgCapa': uploadImageCapa});
      empresa.imgCapa = uploadImageCapa;
    }
  }

  @override
  String toString() {
    return 'Empresa{id: $id, cnpj: $cnpj, razaoSocial: $razaoSocial, nomeLoja: $nomeLoja, phone: $phone, address: $address, serviceEntrega: $serviceEntrega, number: $number, complement: $complement, user: $user, imgCapa: $imgCapa, imgPerfil: $imgPerfil, tempoEntrega: $tempoEntrega, approved: $approved}';
  }
}