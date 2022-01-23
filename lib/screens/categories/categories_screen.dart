import 'package:farerush_empresa/commons/easy_loading.dart';
import 'package:farerush_empresa/commons/routes.dart';
import 'package:farerush_empresa/models/Categorie/Categorie.dart';
import 'package:farerush_empresa/models/company/company.dart';
import 'package:farerush_empresa/repositorys/categories_repository.dart';
import 'package:farerush_empresa/screens/categories/categories_edit_screen.dart';
import 'package:farerush_empresa/store/categorie_store.dart';
import 'package:farerush_empresa/store/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class categoriesScreen extends StatefulWidget {
  @override
  _categoriesScreenState createState() => _categoriesScreenState();
}

class _categoriesScreenState extends State<categoriesScreen> {
  CategorieRepository _categorieRepository = CategorieRepository();
  redirectRoute({context, String value}) {
    switch (value) {
      case 'cat':
        Navigator.pushNamed(context, createCategoriesRoute);
        break;
    }
  }

  _delete({int index, Categorie categorie}) async {
    await _categorieRepository.delete(categorie: categorie).then((value) {
      store.allDocs.removeAt(index);
    });
  }

  menuItensChoice({context, String value, Categorie categorie, int index}) {
    switch (value) {
      case 'editar':
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CategorieEditScreen(
                    categorie: categorie,
                  )),
        );
        break;
      case 'excluir':
        _delete(index: index, categorie: categorie);
        //Navigator.pushNamed(context, createCategoriesRoute);
        break;
    }
  }

  final CategorieStore store = CategorieStore();

  @override
  Widget menuItems(value) {
    switch (value) {
      case 'cat':
        return Row(
          children: [
            Icon(
              Icons.library_add,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Criar Categoria'),
            )
          ],
        );
        break;
      default:
        return SizedBox();
    }
  }

  Widget listTilemenuItems(value) {
    switch (value) {
      case 'editar':
        return Row(
          children: [
            Icon(
              Icons.my_library_books_outlined,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Editar'),
            )
          ],
        );
        break;
      case 'excluir':
        return Row(
          children: [
            Icon(Icons.add_to_photos, color: Colors.black),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Excluir'),
            )
          ],
        );
        break;
      default:
        return SizedBox();
    }
  }

  Widget build(BuildContext context) {
    final UserManagerStore _user = GetIt.I.get<UserManagerStore>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
        centerTitle: true,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: DropdownButton<String>(
                dropdownColor: Colors.white,
                icon: const Icon(Icons.add),
                elevation: 16,
                style: const TextStyle(color: Colors.black),
                underline: SizedBox(),
                onChanged: (String newValue) {
                  redirectRoute(context: context, value: newValue);
                },
                items: <String>[
                  'cat',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    onTap: () {},
                    value: value,
                    child: Container(
                      child: menuItems(value),
                    ),
                  );
                }).toList(),
              ))
        ],
      ),
      body: _body(context),
    );
  }

  Widget _body(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Observer(builder: (_) {
        if (store.loading == true) {
          easyLoading();
          return SizedBox();
        } else {
          dismiss();
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListView.builder(
                itemCount: store.allDocs.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _card(categorie: store.allDocs[index], index: index),
                  );
                }),
          );
        }
      }),
    );
  }

  Widget _card({@required Categorie categorie, int index}) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: Colors.white,
      elevation: 4,
      child: ListTile(
        title: Text(
          categorie.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        trailing: DropdownButton<String>(
          dropdownColor: Colors.white,
          icon: const Icon(Icons.more_vert_rounded, color: Colors.black),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: SizedBox(),
          onChanged: (String newValue) {
            menuItensChoice(
                context: context,
                value: newValue,
                categorie: categorie,
                index: index);
          },
          items: <String>['editar', 'excluir']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              onTap: () {},
              value: value,
              child: Container(
                child: listTilemenuItems(
                  value,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
