import 'package:cached_network_image/cached_network_image.dart';
import 'package:farerush_empresa/commons/easy_loading.dart';
import 'package:farerush_empresa/helpers/extensions.dart';
import 'package:farerush_empresa/commons/routes.dart';
import 'package:farerush_empresa/models/Categorie/Categorie.dart';
import 'package:farerush_empresa/models/product/Product.dart';
import 'package:farerush_empresa/screens/createProduct/update_product_screen.dart';
import 'package:farerush_empresa/store/catalogue_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Catalogue_screen extends StatefulWidget {
  @override
  _Catalogue_screenState createState() => _Catalogue_screenState();
}

class _Catalogue_screenState extends State<Catalogue_screen> {
  CatalogueStore _store = CatalogueStore();

  redirectRoute({context, String value}) {
    switch (value) {
      case 'cat':
        Navigator.pushNamed(context, categoriesRoute);
        break;
      case 'prod':
        Navigator.pushNamed(context, createProductRoute);
        break;
    }
  }

  menuItensChoice({context, String value, Product product}) {
    switch (value) {
      case 'editar':
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UpdateProductScreen(
                    product: product,
                  )),
        );
        break;
      case 'excluir':
        easyLoading();
        _store.delete(product: product);
        dismiss();
        //Navigator.pushNamed(context, createCategoriesRoute);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget menuItems(value) {
      switch (value) {
        case 'cat':
          return Row(
            children: [
              Icon(
                Icons.my_library_books_outlined,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Listar Categorias'),
              )
            ],
          );
          break;
        case 'prod':
          return Row(
            children: [
              Icon(Icons.add_to_photos, color: Colors.black),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Criar Produtos'),
              )
            ],
          );
          break;
        default:
          return SizedBox();
      }
    }

    return Scaffold(
      appBar: AppBar(actions: [
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
              items: <String>['cat', 'prod']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  onTap: () {},
                  value: value,
                  child: Container(
                    child: menuItems(value),
                  ),
                );
              }).toList(),
            ))
      ], centerTitle: true, title: Text('Catálogo')),
      body: Observer(builder: (_) {
        if (_store.isLoading == true) {
          easyLoading();
        } else {
          dismiss();
        }
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: _store.catalogue.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: cardProduct(product: _store.catalogue[index]),
              );
            },
          ),
        );
      }),
    );
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

  Widget card({Product product}) {
    return Material(
      elevation: 8,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(product.title),
          subtitle: Column(
            children: [
              Text('R\$ ${product.price}'),
              Text('Categorie: ${product.categorieName}')
            ],
          ),
          leading: Image.network(product.images[0]),
        ),
      ),
    );
  }

  Widget cardProduct({Product product}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
      child: Card(
        color: Colors.white,
        elevation: 8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 135,
                      width: 127,
                      child: CachedNetworkImage(
                        imageUrl: product.images.isEmpty
                            ? 'https://static.thenounproject.com/png/194055-200.png'
                            : product.images.first,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            product.price.formattedMoney(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                          Text(
                            'Categoria: ${product.categorieName}',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                  DropdownButton<String>(
                    dropdownColor: Colors.white,
                    icon: const Icon(Icons.more_vert_rounded,
                        color: Colors.black),
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    underline: SizedBox(),
                    onChanged: (String newValue) {
                      menuItensChoice(
                        context: context,
                        value: newValue,
                        product: product,
                      );
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
