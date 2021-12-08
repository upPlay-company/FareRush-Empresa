import 'package:brasil_fields/brasil_fields.dart';
import 'package:farerush_empresa/commons/constante.dart';
import 'package:farerush_empresa/store/cep_store.dart';
import 'package:farerush_empresa/store/new_company_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CepField extends StatelessWidget {

  CepField(this.store) : cepStore = store.cepStore;

  final NewCompanyStore store;
  final CepStore cepStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Observer(builder: (_){
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: TextFormField(
              initialValue: cepStore.cep ?? '',
              onChanged: cepStore.setCep,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
              style: TextStyle(color: primaryColor, fontSize: 16),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey)
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey)
                  ),
                  errorText: store.addressError,
                  hintText: "CEP",
                  hintStyle: TextStyle(fontSize: 16, color: primaryColor)),
            ),
          );
        },
        ),
        Observer(builder: (_) {
          if (cepStore.address == null &&
              cepStore.error == null &&
              !cepStore.loading)
            return Container();
          else if (cepStore.address == null && cepStore.error == null)
            return LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
              backgroundColor: Colors.transparent,
            );
          else if (cepStore.error != null)
            return Container(
              decoration: BoxDecoration(
                  color: Colors.red.withAlpha(100),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10)
              ),
              height: 50,
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Text(
                cepStore.error,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
            );
          else {
            final a = cepStore.address;
            return Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withAlpha(150),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10)
              ),
              height: 70,
              padding: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Text(
                'Localização: ${a.logradouro}, Bairro ${a.district}, ${a.cidade.name} - ${a.uf.initials}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }
        }),
      ],
    );
  }
}