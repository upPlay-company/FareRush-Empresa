import 'package:farerush_empresa/screens/inicial/inicial_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fare Rush - Empresa',
      theme: ThemeData(
        primaryColor: Color(0xfff9c817)
      ),
      home: InicialScreen(),
    );
  }
}