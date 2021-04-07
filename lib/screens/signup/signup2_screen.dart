import 'package:brasil_fields/brasil_fields.dart';
import 'package:farerush_empresa/screens/signup/signup3_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp2Screen extends StatefulWidget {
  @override
  _SignUp2ScreenState createState() => _SignUp2ScreenState();
}

class _SignUp2ScreenState extends State<SignUp2Screen> {
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
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Endereço do',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'Restaurante',
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
                padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 4, bottom: 4),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      autocorrect: false,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CepInputFormatter()
                      ],
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'CEP'),
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
                          hintText: 'Cidade'),
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
                          hintText: 'Estado'),
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
                          hintText: 'Bairro'),
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
                          hintText: 'Rua'),
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
                      keyboardType: TextInputType.number,
                      autocorrect: false,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Número'),
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
                          hintText: 'Complemento'),
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp3Screen()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(
                    'Próximo',
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
