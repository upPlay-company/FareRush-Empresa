import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farerush_empresa/models/company/company.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserUser {

  String id;
  String apelido;
  String nameUser;
  String phone;
  String email;
  String pass;
  String confirmPass;
  bool termos;
  bool approved;
  Timestamp created;
  Company company;

  UserUser({this.id,
    this.apelido,
    this.nameUser,
    this.phone,
    this.email,
    this.pass,
    this.confirmPass,
    this.termos,
    this.approved,
    this.created});

  UserUser.fromDocument(DocumentSnapshot doc){
    id = doc.id;
    nameUser = doc.data()['nameUser'] as String;
    apelido = doc.data()['apelido'] as String;
    email = doc.data()['email'] as String;
    phone = doc.data()['phone'] as String;
    created = doc.data()['created'] as Timestamp;
    if(doc.data().containsKey('id_empresa')){
      company = Company(
          id: doc.data()['id_empresa']
      );
    }
    termos = doc.data()['termos'] as bool;
    if(doc.data().containsKey('aprovado')){
      approved = doc.data()['aprovado'] as bool;
    }
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final FirebaseStorage storage = FirebaseStorage.instance;


  Reference get storageRef => storage.ref().child('users_company').child(id);

  DocumentReference get firestoreRef =>
      FirebaseFirestore.instance.doc('users_company/$id');

  CollectionReference get tokensReference => firestoreRef.collection('tokens');

  Future<void> saveData() async {
    await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'nameUser': nameUser,
      'apelido': apelido,
      'email': email,
      'phone': phone,
      'created': FieldValue.serverTimestamp(),
      'aprovado': approved,
      'termos': termos,
    };
  }

  Map<String, dynamic> updateToMap(){
    return {
      'nameUser': nameUser,
      'apelido': apelido,
      'email': email,
      'phone': phone,
    };
  }

  Future<void> save(UserUser user) async {
    if (id == null) {
      final doc = await firestoreRef.collection('users').add(toMap());
      id = doc.id;
    } else {
      await firestoreRef.update(updateToMap());
    }
  }

  Future<void> saveToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    tokensReference.doc(token).set({
      'token': token,
      'updateAt': FieldValue.serverTimestamp(),
      'platform': Platform.operatingSystem
    });
  }

  @override
  String toString() {
    return 'UserUser{id: $id, apelido: $apelido, nameUser: $nameUser, phone: $phone, email: $email, termos: $termos, approved: $approved, created: $created, empresa: $company}';
  }
}