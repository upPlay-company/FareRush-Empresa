import 'package:farerush_empresa/screens/pedidos/pedidos_screen.dart';
import 'package:farerush_empresa/screens/perfil/perfil_screen.dart';
import 'package:farerush_empresa/screens/vitrine/vitrine_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmnav/bmnav.dart' as bmnav;

class BaseScreen extends StatefulWidget {

  @override
  _BaseScreenState createState() => _BaseScreenState();
}


class _BaseScreenState extends State<BaseScreen> {

  int _selectedIndex = 0;
  /*static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);*/
  static List<Widget> _widgetOptions = <Widget>[
    PedidosScreen(),
    VitrineScreen(),
    PerfilScreen(),
  ];

  Widget currentScreen = PedidosScreen();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: bmnav.BottomNav(
        iconStyle: bmnav.IconStyle(color: Colors.black, onSelectColor: Theme.of(context).primaryColor),
        index: _selectedIndex,
        labelStyle: bmnav.LabelStyle(textStyle: TextStyle(color: Colors.black, fontSize: 10), onSelectTextStyle: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14)),
        onTap: (i){
          setState(() {
            _selectedIndex = i;
            currentScreen = _widgetOptions[i];
          });
        },
        items: [
          bmnav.BottomNavItem(Icons.description, label: 'Pedidos'),
          bmnav.BottomNavItem(Icons.add_business, label: 'Vitrine'),
          bmnav.BottomNavItem(Icons.person, label: 'Perfil'),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
