import 'package:farerush_empresa/commons/routes.dart';
import 'package:flutter/material.dart';

class sideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.

      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
              child: Text('Mudar o drawer quando tiver pronto',
                  style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              title: const Text(
                'Catálogo',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.pushNamed(context, catalogueRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
