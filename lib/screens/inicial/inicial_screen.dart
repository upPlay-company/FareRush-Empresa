import 'package:farerush_empresa/screens/inicial/components/back_image.dart';
import 'package:farerush_empresa/screens/login/login_screen.dart';
import 'package:farerush_empresa/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';

class InicialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackImage(
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    width: 200,
                  )
                ),
              ],
            ),
          ),
        bottomNavigationBar: Card(
          color: Colors.white,
          child: Container(
            height: 220,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Venda mais rápido com', style: TextStyle(
                          color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800
                        ),
                      ),
                      Text('Fare Rush - Delivery Parceiros', style: TextStyle(
                          color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800
                        ),
                      )
                    ],
                  )
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SizedBox(
                    height: 54,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Text(
                        'Entre Agora',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            fontFamily: 'Principal'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: SizedBox(
                    height: 54,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Text(
                        'Criar Conta',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            fontFamily: 'Principal'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        ),
    );
  }
}