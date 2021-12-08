import 'package:farerush_empresa/commons/routes.dart';
import 'package:farerush_empresa/store/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';

class PerfilScreen extends StatelessWidget {

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Container(
          color: Colors.grey[200],
          height: screenSize.height * 0.3,
          child: SafeArea(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.topRight,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("images/inicial.png"),
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    userManagerStore.user.nameUser,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Icon(Icons.arrow_forward_ios, size: 15, color: Colors.grey,),
                )
              ],
            )
        ),
      ),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: () {},
            child: rowsColumns(
              "Histórico",
              Icons.update,
              Icons.arrow_forward_ios,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: rowsColumns(
              "Faturamento",
              Icons.account_balance_wallet_rounded,
              Icons.arrow_forward_ios,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: rowsColumns(
              "Endereço",
              Icons.location_pin,
              Icons.arrow_forward_ios,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: rowsColumns(
              "Configuração",
              Icons.settings,
              Icons.arrow_forward_ios,
            ),
          ),
          SizedBox(height: 50,),
          Container(
            height: 0.5,
            color: Colors.grey[300],
          ),
          Container(
            height: 40,
            color: Colors.grey[200],
            child: Center(
              child: GestureDetector(
                onTap: (){
                  userManagerStore.logout();
                  Navigator.pushNamedAndRemoveUntil(context, rootRoute, (route) => false);
                },
                child: Text('Sair', style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
            ),
          ),
          Container(
            height: 0.5,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}

Widget rowsColumns(String title, IconData iconLeft, IconData iconRight) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 15,
      top: 8,
    ),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: 35,
              width: 35,
              child: Icon(
                iconLeft,
                size: 25,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 5,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Icon(
                iconRight,
                color: Colors.black,
                size: 20,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
