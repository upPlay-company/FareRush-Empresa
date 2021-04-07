import 'package:brasil_fields/brasil_fields.dart';
import 'package:farerush_empresa/screens/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp3Screen extends StatefulWidget {
  @override
  _SignUp3ScreenState createState() => _SignUp3ScreenState();
}

class _SignUp3ScreenState extends State<SignUp3Screen> {
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
            Padding(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 4, bottom: 4),
                    child: TextFormField(
                      autocorrect: false,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nome Completo'),
                    ),
                  ),
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 4, bottom: 4),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email'),
                    ),
                  ),
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 4, bottom: 4),
                    child: TextFormField(
                      autocorrect: false,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(15),
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter(),
                      ],
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Número Celular'),
                    ),
                  ),
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 4, bottom: 4),
                    child: TextFormField(
                      autocorrect: false,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Como você conheceu o Fare Rush?'),
                    ),
                  ),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: SizedBox(
                height: 54,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => BaseScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(
                    'Concluir',
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
    );
  }
}
