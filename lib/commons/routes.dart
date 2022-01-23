import 'package:farerush_empresa/screens/base/base_screen.dart';
import 'package:farerush_empresa/screens/catalogue/catalogue_screen.dart';
import 'package:farerush_empresa/screens/categories/categories_edit_screen.dart';
import 'package:farerush_empresa/screens/categories/categories_screen.dart';
import 'package:farerush_empresa/screens/createCategorie/create_categorie_screen.dart';
import 'package:farerush_empresa/screens/createProduct/create_product_screen.dart';
import 'package:farerush_empresa/screens/faturamento/farutamento_screen.dart';
import 'package:farerush_empresa/screens/inicial/inicial_screen.dart';
import 'package:farerush_empresa/screens/login/login_screen.dart';
import 'package:farerush_empresa/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';

const String rootRoute = "/";

const String faturamentoRoute = "/faturamento_screen";
const String baseRoute = "/base_screen";
const String signupRoute = "/signup_screen";
const String loginRoute = "/login";
const String catalogueRoute = "/catalogue";
const String categoriesRoute = "/categories";
const String createCategoriesRoute = "/categories/create";
const String editCategoriesRoute = "/categories/edit";
const String createProductRoute = "product/create";

class RouterManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case faturamentoRoute:
        return MaterialPageRoute(builder: (context) => FaturamentoScreen());
      case baseRoute:
        return MaterialPageRoute(builder: (context) => BaseScreen());
      case signupRoute:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case rootRoute:
        return MaterialPageRoute(builder: (context) => InitialScreen());
      case catalogueRoute:
        return MaterialPageRoute(builder: (context) => Catalogue_screen());
      case categoriesRoute:
        return MaterialPageRoute(builder: (context) => categoriesScreen());
      case createCategoriesRoute:
        return MaterialPageRoute(
            builder: (context) => create_categorie_screen());
      case createProductRoute:
        return MaterialPageRoute(builder: (context) => CreateProductScreen());
      case editCategoriesRoute:
        return MaterialPageRoute(builder: (context) => CategorieEditScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
