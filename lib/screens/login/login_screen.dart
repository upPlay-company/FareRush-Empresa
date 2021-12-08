import 'package:farerush_empresa/commons/constante.dart';
import 'package:farerush_empresa/commons/routes.dart';
import 'package:farerush_empresa/store/login_store.dart';
import 'package:farerush_empresa/store/user_manager_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final LoginStore loginStore = LoginStore();

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  bool visiblePass;

  @override
  void initState() {
    super.initState();

    visiblePass = true;

    when((_) => userManagerStore.user != null, () {
      // if(userManagerStore.user.approved == true) {
         Navigator.of(context).pushNamedAndRemoveUntil(
           baseRoute, (Route<dynamic> route) => false,);
      // }
      // else {
      //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => Container(color: Colors.black)),
      //         (Route<dynamic> route) => false,);
      //}

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        'Entrar',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Observer(builder: (_){
              return Padding(
                  padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
                  child: TextFormField(
                    onChanged: loginStore.setEmail,
                    enabled: !loginStore.loading,
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
                        errorText: loginStore.emailError,
                        prefixIcon: Icon(Icons.email, color: primaryColor),
                        hintText: 'Digite seu E-mail',
                        hintStyle: TextStyle(fontSize: 16, color: primaryColor)
                    ),
                  ));
            }),
            Observer(builder: (_){
              return Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: TextFormField(
                    onChanged: loginStore.setPassword,
                    enabled: !loginStore.loading,
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
                        errorText: loginStore.passwordError,
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
                        prefixIcon: Icon(Icons.lock, color: primaryColor),
                        hintText: 'Digite sua senha',
                        hintStyle: TextStyle(fontSize: 16, color: primaryColor)
                    ),
                  ));
            }),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushNamed('');
                    },
                    child: Text(
                        'Esqueceu sua senha?',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12)),
                  ),
                ],
              ),
            ),
            Observer(builder: (_){
              return Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: SizedBox(
                  height: 54,
                  child: ElevatedButton(
                    onPressed: loginStore.loginPressed,
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      onSurface: primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      'Entrar',
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
