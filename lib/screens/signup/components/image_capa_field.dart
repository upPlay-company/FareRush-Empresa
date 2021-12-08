import 'dart:io';
import 'package:farerush_empresa/commons/constante.dart';
import 'package:farerush_empresa/commons/image_dialog.dart';
import 'package:farerush_empresa/screens/signup/components/image_source_capa.dart';
import 'package:farerush_empresa/store/new_company_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ImagesCapaField extends StatelessWidget {

  ImagesCapaField(this.store);

  final NewCompanyStore store;

  @override
  Widget build(BuildContext context) {

    void onImageSelected(File image){
      store.imgCapa.add(image);
      Navigator.of(context).pop();
    }

    return Column(
      children: [
        Container(
            height: 120,
            child: Observer(
              builder: (_) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: store.imgCapa.length < 1 ?
                    store.imgCapa.length + 1 : 1,
                    itemBuilder: (_, index) {
                      if(index == store.imgCapa.length)
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                          child: GestureDetector(
                            onTap: (){
                              if(Platform.isAndroid){
                                showModalBottomSheet(
                                    context: context,
                                    builder: (_) => ImageSourceCapa(onImageSelected)
                                );
                              } else {
                                showCupertinoModalPopup(
                                    context: context,
                                    builder: (_) => ImageSourceCapa(onImageSelected)
                                );
                              }
                            },
                            child: Container(
                              width: 150,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      else
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                          child: GestureDetector(
                            onTap: (){
                              showDialog(
                                  context: context,
                                  builder: (_) => ImageDialog(
                                      image: store.imgCapa[index],
                                      onDelete: () => store.imgCapa.removeAt(index)
                                  )
                              );
                            },
                            child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: store.imgCapa[index] is File
                                          ? FileImage(
                                        store.imgCapa[index],
                                      ) : NetworkImage(store.imgCapa[index]),
                                    )
                                )
                            ),
                          ),
                        );
                    }
                );
              },
            )
        ),
        Observer(builder: (_){
          if(store.imgCapaError != null)
            return Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.red)
                  )
              ),
              padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
              child: Text(
                store.imgCapaError,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 12
                ),
              ),
            );
          else return Container();
        },
        )
      ],
    );
  }
}