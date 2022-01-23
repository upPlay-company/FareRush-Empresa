import 'package:farerush_empresa/commons/routes.dart';
import 'package:farerush_empresa/commons/sideMenu.dart';
import 'package:flutter/material.dart';

class VitrineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('vitrine'),
      ),
      drawer: sideMenu(),
    );
  }
}
