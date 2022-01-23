import 'package:farerush_empresa/commons/easy_loading.dart';
import 'package:farerush_empresa/commons/routes.dart';
import 'package:farerush_empresa/models/Categorie/Categorie.dart';
import 'package:farerush_empresa/models/users/user.dart';
import 'package:farerush_empresa/repositorys/categories_repository.dart';
import 'package:farerush_empresa/store/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class create_categorie_screen extends StatefulWidget {
  @override
  _create_categorie_screenState createState() =>
      _create_categorie_screenState();
}

class _create_categorie_screenState extends State<create_categorie_screen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _pos = TextEditingController();
  CategorieRepository _categorieRepository = CategorieRepository();
  _saveCategorie({String companyId}) {
    easyLoading();
    Categorie categorie =
        Categorie(name: _name.text, pos: int.tryParse(_pos.text));
    _categorieRepository
        .save(categorie: categorie, companyId: companyId)
        .then((value) {
      _name.text = '';
      _pos.text = '';
      dismiss();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.black,
          content: Text(
            value,
            style: TextStyle(color: Colors.white),
          )));
    }).onError((error, stackTrace) {
      dismiss();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.black,
          content: Text(
            error,
            style: TextStyle(color: Colors.white),
          )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Categoria'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, categoriesRoute);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: body(context: context),
    );
  }

  Widget body({context}) {
    final UserManagerStore _user = GetIt.I.get<UserManagerStore>();
    return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      TextField(
                        controller: _name,
                        onChanged: (value) => _name,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Nome da Categoria *',
                            contentPadding: EdgeInsets.all(10.0),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            )),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: _pos,
                        onChanged: (value) => _pos,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Posição da categoria *',
                            contentPadding: EdgeInsets.all(10.0),
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                ))),
                            onPressed: () async {
                              UserUser userUser = _user.user;
                              _saveCategorie(companyId: userUser.company.id);
                            },
                            child: Text('salvar')),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

/*
Column(
            children: [
              TextField(
                controller: _nome,
                onChanged: (value) => _nome,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Nome da Categoria *',
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
              TextField(
                controller: _nome,
                onChanged: (value) => _nome,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Posição da categoria *',
                    hintStyle: TextStyle(color: Colors.grey)),
              ),
              ElevatedButton(onPressed: () {}, child: Text('salvar')),
            ],
          ),
 */