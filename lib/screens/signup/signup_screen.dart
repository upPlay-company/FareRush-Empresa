import 'package:brasil_fields/brasil_fields.dart';
import 'package:farerush_empresa/commons/constante.dart';
import 'package:farerush_empresa/models/company/company.dart';
import 'package:farerush_empresa/screens/signup/components/cep_field.dart';
import 'package:farerush_empresa/screens/signup/components/image_capa_field.dart';
import 'package:farerush_empresa/screens/signup/components/image_perfil_field.dart';
import 'package:farerush_empresa/screens/signup/signup_user_screen.dart';
import 'package:farerush_empresa/store/new_company_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final NewCompanyStore store = NewCompanyStore(empresa: Company());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: Navigator.of(context).pop,
        child: Icon(Icons.arrow_back_ios, color: Colors.black,),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Observer(builder: (_){
        print(store.formValid);
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Vamos Começar',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          'Insira as Informações da sua loja',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Observer(builder: (_){
                return Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                    child: TextFormField(
                      onChanged: store.setCnpj,
                      enabled: !store.loading,
                      autocorrect: false,
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 16
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CnpjInputFormatter(),
                      ],
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                          errorText: store.cnpjError,
                          hintText: 'CNPJ *',
                          hintStyle: TextStyle(fontSize: 16, color: primaryColor)
                      ),
                    ));
              }),
              Observer(builder: (_){
                return Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: TextFormField(
                      onChanged: store.setNome,
                      enabled: !store.loading,
                      autocorrect: false,
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 16
                      ),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                          errorText: store.nomeError,
                          hintText: 'Nome fantasia *',
                          hintStyle: TextStyle(fontSize: 16, color: primaryColor)
                      ),
                    ));
              }),
              Observer(builder: (_){
                return Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: TextFormField(
                      onChanged: store.setRazaoSocial,
                      enabled: !store.loading,
                      autocorrect: false,
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 16
                      ),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                          errorText: store.nomeError,
                          hintText: 'Razão social *',
                          hintStyle: TextStyle(fontSize: 16, color: primaryColor)
                      ),
                    ));
              }),
              Observer(builder: (_){
                return Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: TextFormField(
                      onChanged: store.setNumero,
                      enabled: !store.loading,
                      autocorrect: false,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(15),
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter()
                      ],
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 16
                      ),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                          errorText: store.numeroError,
                          hintText: 'Telefone comercial *',
                          hintStyle: TextStyle(fontSize: 16, color: primaryColor)
                      ),
                    ));
              }),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 5, 10, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sua loja já tem o serviço de entrega?",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Observer(builder: (_) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            value: true,
                            onChanged: store.setServiceEntrega,
                            groupValue: store.serviceEntrega,
                            activeColor: primaryColor,
                            hoverColor: primaryColor,
                          ),
                          Text('Sim', style: TextStyle(color: primaryColor)),
                          SizedBox(
                            width: 50,
                          ),
                          Radio(
                            onChanged: store.setServiceEntrega,
                            groupValue: store.serviceEntrega,
                            value: false,
                            activeColor: primaryColor,
                          ),
                          Text('Não', style: TextStyle(color: primaryColor)),
                        ],
                      );
                    })
                  ],
                ),
              ),
              Observer(builder: (_){
                return Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: TextFormField(
                      onChanged: store.setTempoPreparo,
                      enabled: !store.loading,
                      autocorrect: false,
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
                          errorText: store.tempoPreparoError,
                          hintText: "Tempo de entrega",
                          helperText: '30 min à 60 min',
                          helperStyle: TextStyle(fontSize: 12, color: primaryColor),
                          hintStyle: TextStyle(fontSize: 16, color: primaryColor)
                      ),
                    ));
              }),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4, bottom: 10),
                      child: Text(
                        "Endereço do sua loja",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    CepField(store),
                  ],
                ),
              ),
              if (store.address != null)...[
                Observer(builder: (_) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: TextFormField(
                      onChanged: store.setNumberEndereco,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: primaryColor, fontSize: 16),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                          errorText: store.numberError,
                          hintText: "Número da loja",
                          hintStyle: TextStyle(fontSize: 16, color: primaryColor)
                      ),
                    ),
                  );
                }),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: TextFormField(
                    onChanged: store.setComplementEndereco,
                    keyboardType: TextInputType.text,
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
                      hintText: "Complemento (opcional)",
                      hintStyle: TextStyle(fontSize: 16, color: primaryColor),
                    ),
                  ),
                ),
              ],
              Padding(
                padding: EdgeInsets.fromLTRB(24, 5, 10, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Escolha uma foto de perfil da sua loja",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    ImagesPerfilField(store),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 5, 10, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Escolha uma foto de capa da sua loja",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    ImagesCapaField(store),
                  ],
                ),
              ),
              Observer(builder: (_){
                return GestureDetector(
                  onTap: store.invalidSendPressed,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: SizedBox(
                      height: 54,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: store.formValid ? (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpUserScreen(store)));
                        } : null,
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          onSurface: primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: Text(
                          'Próximo',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        );
      }),
    );
  }
}
