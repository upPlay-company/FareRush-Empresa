import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'Vamos Começar',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'Informações do seu Restaurante',
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
            Padding(
                padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
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
                          hintText: 'Nome do Restaurante'),
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
                      inputFormatters: [],
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Contato do Restaurante'),
                    ),
                  ),
                ))

          ],
        ),
      ),
    );
  }
}
