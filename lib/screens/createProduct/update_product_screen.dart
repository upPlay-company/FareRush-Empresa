import 'dart:io';
import 'package:farerush_empresa/helpers/extensions.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:farerush_empresa/commons/easy_loading.dart';
import 'package:farerush_empresa/models/Categorie/Categorie.dart';
import 'package:farerush_empresa/models/product/Product.dart';
import 'package:farerush_empresa/models/product/adittional/Additional.dart';
import 'package:farerush_empresa/repositorys/product_repository.dart';
import 'package:farerush_empresa/store/categorie_store.dart';
import 'package:farerush_empresa/store/product_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

class UpdateProductScreen extends StatefulWidget {
  @override
  _UpdateProductScreenState createState() => _UpdateProductScreenState();
  Product product;
  UpdateProductScreen({Product product}) {
    this.product = product;
  }
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final ProductStore _store = ProductStore();
  final ImagePicker _picker = ImagePicker();
  final ProductRepository _productRepository = ProductRepository();
  final CategorieStore _categorieStore = CategorieStore();
  List<String> _imagesList = [];
  final labelStyle =
      TextStyle(fontWeight: FontWeight.w800, color: Colors.grey, fontSize: 14);
  @override
  void initState() {
    _store.setTitle(widget.product.title);
    _store.setDescription(widget.product.description);
    _store.setPrice(widget.product.price);
    _store.setQuant(widget.product.quant);
    widget.product.additionals.isNotEmpty
        ? _store.setHasAdditional(true)
        : _store.setHasAdditional(false);

    if (widget.product.additionals.isNotEmpty) {
      widget.product.additionals.forEach((element) {
        _store.additionals.add(element);
      });
    }

    super.initState();
  }

  _categoryDrop() {
    return Observer(builder: (_) {
      if (_categorieStore.allDocs.isNotEmpty) {
        Categorie _cat = _categorieStore.allDocs.firstWhere(
            (element) => element.name == widget.product.categorieName);
        _store.setCategorie(_cat);
      }
      return DropdownSearch<Categorie>(
        popupBackgroundColor: Colors.white,
        mode: Mode.MENU,
        selectedItem: _store.categorie,
        showSelectedItems: false,
        items: _categorieStore.allDocs,
        dropdownBuilder: (context, selectedItem) {
          return selectedItem == null
              ? Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('selecione uma categoria'),
                      Icon(
                        Icons.arrow_drop_down_outlined,
                        color: Colors.black,
                        size: 32,
                      )
                    ],
                  ),
                )
              : Text(selectedItem.name);
        },
        onChanged: (value) {
          _store.setCategorie(value);
        },
      );
    });
  }

  final contentPadding = const EdgeInsets.fromLTRB(16, 10, 12, 10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Produtos'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: _body()),
        ),
      )),
    );
  }

  Widget _body() {
    return Column(
      children: [
        _getImages(),
        TextFormField(
          initialValue: _store.title != null ? _store.title : '',
          onChanged: _store.setTitle,
          maxLines: null,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            fillColor: Colors.black,
            hoverColor: Colors.black,
            focusColor: Colors.black,
            hintText: 'Ex: Pizza de calabresa com...',
            labelText: 'Título *',
            labelStyle: labelStyle,
            contentPadding: contentPadding,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(
            color: Colors.black,
          ),
        ),
        TextFormField(
          initialValue: _store.description != null ? _store.description : '',
          onChanged: _store.setDescription,
          maxLines: null,
          decoration: InputDecoration(
            hintText: 'Ex: Pizza de calabresa com...',
            labelText: 'Descrição *',
            labelStyle: labelStyle,
            contentPadding: contentPadding,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(
            color: Colors.black,
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          initialValue: _store.quant != null ? _store.quant.toString() : '',
          onChanged: (value) => _store.setQuant(int.parse(value)),
          decoration: InputDecoration(
            hintText: 'Ex: 1, 2 ou 3 pessoas',
            labelText: 'Serve quantas pessoas *',
            labelStyle: labelStyle,
            contentPadding: contentPadding,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(
            color: Colors.black,
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.number,
          initialValue:
              _store.price != null ? _store.price.formattedMoney() : '',
          onChanged: (value) =>
              _store.setPrice(UtilBrasilFields.converterMoedaParaDouble(value)),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            RealInputFormatter(centavos: true)
          ],
          decoration: InputDecoration(
            hintText: 'Ex: R\$45,00',
            labelText: 'Preço *',
            prefixText: 'R\$',
            labelStyle: labelStyle,
            contentPadding: contentPadding,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(
            color: Colors.black,
          ),
        ),
        _categoryDrop(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(
            color: Colors.black,
          ),
        ),
        _adicionais(),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black)),
              onPressed: () {
                Product product = Product(
                    title: _store.title,
                    description: _store.description,
                    additionals: _store.additionals,
                    categorie: _store.categorie,
                    images: _store.images,
                    price: _store.price,
                    quant: _store.quant);
                product.id = widget.product.id;
                print(product.toMap());
                print('atualizar');
              },
              child: Text('Salvar')),
        )
      ],
    );
  }

  Widget _getImages() {
    return Observer(builder: (_) {
      return GestureDetector(
        onTap: () async {
          PickedFile image =
              await _picker.getImage(source: ImageSource.gallery);
          if (image.path != null) {
            _store.images.clear();
            _store.images.add(image.path);
          }
        },
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: Colors.grey[300],
            ),
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: _store.images.isNotEmpty
                ? ClipRRect(
                    child: Image.file(
                      File(_store.images[0]),
                      fit: BoxFit.cover,
                    ),
                  )
                : widget.product.images.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: Colors.grey),
                            child: Icon(
                              Icons.add_a_photo,
                              size: 48,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : ClipRRect(
                        child: Image.network(
                          widget.product.images[0],
                          fit: BoxFit.cover,
                        ),
                      )),
      );
    });
  }

  Widget _adicionais() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Adicionar itens Adicionais'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Observer(builder: (_) {
              return Radio(
                value: true,
                onChanged: _store.setHasAdditional,
                groupValue: _store.hasAdditional,
                hoverColor: Colors.black,
                fillColor: MaterialStateProperty.all<Color>(Colors.black),
                overlayColor: MaterialStateProperty.all<Color>(Colors.black),
                activeColor: Theme.of(context).primaryColor,
              );
            }),
            Text('Sim'),
            SizedBox(
              width: 50,
            ),
            Observer(builder: (_) {
              return Radio(
                value: false,
                onChanged: _store.setHasAdditional,
                groupValue: _store.hasAdditional,
                hoverColor: Colors.black,
                fillColor: MaterialStateProperty.all<Color>(Colors.black),
                overlayColor: MaterialStateProperty.all<Color>(Colors.black),
                activeColor: Theme.of(context).primaryColor,
              );
            }),
            Text('Não'),
          ],
        ),
        Observer(builder: (_) {
          return !_store.hasAdditional
              ? SizedBox()
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Itens Adicionais*'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    // retorna um objeto do tipo Dialog
                                    String name = '';
                                    String price = '';
                                    return AlertDialog(
                                      backgroundColor: Colors.white,
                                      title: Text(
                                        'Criar Adicional para o produto',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      content: SingleChildScrollView(
                                        child: Container(
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                initialValue: '',
                                                onChanged: (value) {
                                                  name = value;
                                                },
                                                maxLines: null,
                                                decoration: InputDecoration(
                                                    hintText: 'Ex: Bacon extra',
                                                    labelText: 'Nome *',
                                                    labelStyle: labelStyle,
                                                    contentPadding:
                                                        contentPadding,
                                                    errorText: ''),
                                              ),
                                              TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                initialValue: '',
                                                onChanged: (value) {
                                                  price = value;
                                                },
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  RealInputFormatter(
                                                      centavos: true)
                                                ],
                                                decoration: InputDecoration(
                                                    hintText: 'Ex: R\$2,00',
                                                    labelText: 'Preço *',
                                                    prefixText: 'R\$',
                                                    labelStyle: labelStyle,
                                                    contentPadding:
                                                        contentPadding,
                                                    errorText: ''),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      actions: <Widget>[
                                        // define os botões na base do dialogo
                                        TextButton(
                                          child: Text(
                                            "salvar",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {
                                            Additional additionals =
                                                Additional(name, price);
                                            _store.additionals.add(additionals);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text(
                                            "Fechar",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.black,
                              )),
                        )
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Observer(builder: (_) {
                        return ListView.builder(
                            itemCount: _store.additionals.length,
                            itemBuilder: (context, index) {
                              Additional _additional =
                                  _store.additionals[index];
                              return ListTile(
                                title: Text(_additional.name),
                                subtitle: Text(_additional.price),
                              );
                            });
                      }),
                    )
                  ],
                );
        })
      ],
    );
  }
}
