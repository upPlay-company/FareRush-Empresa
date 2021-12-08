import 'package:farerush_empresa/screens/base/base_screen.dart';
import 'package:farerush_empresa/screens/inicial/inicial_screen.dart';
import 'package:farerush_empresa/screens/login/login_screen.dart';
import 'package:farerush_empresa/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';

const String rootRoute = "/";

const String baseRoute = "/base_screen";
const String signupRoute = "/signup_screen";
const String loginRoute = "/login";

class RouterManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case baseRoute:
        return MaterialPageRoute(builder: (context) => BaseScreen());
      case signupRoute:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case rootRoute:
        return MaterialPageRoute(builder: (context) => InitialScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}
