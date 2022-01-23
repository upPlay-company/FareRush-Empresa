import 'package:farerush_empresa/commons/easy_loading.dart';
import 'package:farerush_empresa/commons/routes.dart';
import 'package:farerush_empresa/models/Categorie/Categorie.dart';
import 'package:farerush_empresa/models/users/user.dart';
import 'package:farerush_empresa/repositorys/categories_repository.dart';
import 'package:farerush_empresa/screens/categories/categories_screen.dart';
import 'package:farerush_empresa/store/categorie_store.dart';
import 'package:farerush_empresa/store/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CategorieEditScreen extends StatefulWidget {
  @override
  _CategorieEditScreenState createState() => _CategorieEditScreenState();
  Categorie categorie;
  CategorieEditScreen({Categorie categorie}) {
    this.categorie = categorie;
  }
}

class _CategorieEditScreenState extends State<CategorieEditScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _pos = TextEditingController();
  CategorieRepository _categorieRepository = CategorieRepository();
  Categorie categorie;

  @override
  void initState() {
    categorie = widget.categorie;
    _name.text = categorie.name;
    _pos.text = categorie.pos.toString();
    super.initState();
  }

  _updateCategorie({String companyId}) {
    print(categorie.id);
    easyLoading();
    Categorie _newCategorie = categorie;
    _newCategorie.name = _name.text;
    _newCategorie.pos = int.parse(_pos.text);

    _categorieRepository
        .update(categorie: _newCategorie, companyId: companyId)
        .then((value) {
      dismiss();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.black,
          content: Text(
            value,
            style: TextStyle(color: Colors.white),
          )));
    }).onError((error, stackTrace) {
      dismiss();
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.black,
          content: Text(
            'Não foi possivel atualizar a categoria',
            style: TextStyle(color: Colors.white),
          )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, categoriesRoute);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('Editar Categoria'),
        centerTitle: true,
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
                            onPressed: () {
                              UserUser userUser = _user.user;

                              _updateCategorie(companyId: userUser.company.id);
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
