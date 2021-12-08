import 'package:brasil_fields/brasil_fields.dart';
import 'package:farerush_empresa/commons/constante.dart';
import 'package:farerush_empresa/screens/base/base_screen.dart';
import 'package:farerush_empresa/store/new_company_store.dart';
import 'package:farerush_empresa/store/signup_store.dart';
import 'package:farerush_empresa/store/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class SignUpUserScreen extends StatefulWidget {

  SignUpUserScreen(this.store);

  final NewCompanyStore store;

  @override
  _SignUpUserScreenState createState() => _SignUpUserScreenState(store);
}

class _SignUpUserScreenState extends State<SignUpUserScreen> {

  _SignUpUserScreenState(this.store);

  final NewCompanyStore store;
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();
  final SignUpStore signUpStore = SignUpStore();

  bool visiblePass;
  bool visiblePass1;

  @override
  void initState() {
    super.initState();

    visiblePass = true;
    visiblePass1 = true;

    when((_) => userManagerStore.user != null && store.savedEmp, () {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => BaseScreen()),
            (Route<dynamic> route) => false,);
    });
  }

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Informações do',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'Representante Legal',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Observer(builder: (_){
              return Padding(
                  padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
                  child: TextFormField(
                    onChanged: signUpStore.setUserName,
                    enabled: !signUpStore.loading,
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
                        errorText: signUpStore.userNameError,
                        hintText: 'Apelido *',
                        hintStyle: TextStyle(fontSize: 16, color: primaryColor)
                    ),
                  ));
            }),
            Observer(builder: (_){
              return Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: TextFormField(
                    onChanged: signUpStore.setNameUser,
                    enabled: !signUpStore.loading,
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
                        errorText: signUpStore.nameUserError,
                        hintText: 'Nome completo *',
                        hintStyle: TextStyle(fontSize: 16, color: primaryColor)
                    ),
                  ));
            }),
            Observer(builder: (_){
              return Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: TextFormField(
                    onChanged: signUpStore.setEmail,
                    enabled: !signUpStore.loading,
                    keyboardType: TextInputType.emailAddress,
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
                        errorText: signUpStore.emailError,
                        hintText: 'E-mail *',
                        hintStyle: TextStyle(fontSize: 16, color: primaryColor)
                    ),
                  ));
            }),
            Observer(builder: (_){
              return Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: TextFormField(
                    onChanged: signUpStore.setPhone,
                    enabled: !signUpStore.loading,
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
                        errorText: signUpStore.phoneError,
                        hintText: 'Telefone celular *',
                        hintStyle: TextStyle(fontSize: 16, color: primaryColor)
                    ),
                  ));
            }),
            Observer(builder: (_){
              return Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: TextFormField(
                    onChanged: signUpStore.setPass1,
                    enabled: !signUpStore.loading,
                    autocorrect: false,
                    obscureText: visiblePass,
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
                        errorText: signUpStore.pass1Error,
                        suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                visiblePass ? visiblePass = false : visiblePass = true;
                              });
                            },
                            icon: Icon(
                                visiblePass
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: primaryColor),
                            color: primaryColor
                        ),
                        hintText: 'Digite uma senha',
                        hintStyle: TextStyle(fontSize: 16, color: primaryColor)
                    ),
                  ));
            }),
            Observer(builder: (_){
              return Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: TextFormField(
                    onChanged: signUpStore.setPass2,
                    enabled: !signUpStore.loading,
                    autocorrect: false,
                    obscureText: visiblePass1,
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
                        errorText: signUpStore.pass2Error,
                        suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                visiblePass1 ? visiblePass1 = false : visiblePass1 = true;
                              });
                            },
                            icon: Icon(
                                visiblePass1
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: primaryColor),
                            color: primaryColor
                        ),
                        hintText: 'Confirmar senha',
                        hintStyle: TextStyle(fontSize: 16, color: primaryColor)
                    ),
                  ));
            }),
            Observer(builder: (_){
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Checkbox(
                        value: signUpStore.termos,
                        onChanged: signUpStore.setTermos,
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.all(primaryColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                        ),
                      )
                  ),
                  Text('Eu li e aceito os ', style: TextStyle(color: primaryColor)),
                  GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => Container()
                        ));
                      },
                      child: Text('termos de uso', style: TextStyle(color: secondaryColor))),
                ],
              );
            }),
            Observer(builder: (_){
              return Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: SizedBox(
                  height: 54,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: signUpStore.isFormValid ? () async {
                      await signUpStore.signUpPressed();
                      if(userManagerStore.user != null){
                        await store.sendPressed();
                      }
                    } : null,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onSurface: primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      'Concluir',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
