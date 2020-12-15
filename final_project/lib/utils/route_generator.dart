import 'package:flutter/material.dart';
import 'package:qolbuyim/pages/auth_page.dart';
import 'package:qolbuyim/pages/basket_page.dart';
import 'package:qolbuyim/pages/category_page.dart';
import 'package:qolbuyim/pages/favourite_page.dart';
import 'package:qolbuyim/pages/first_welcome.dart';
import 'package:qolbuyim/pages/login_page.dart';
import 'package:qolbuyim/pages/main_page.dart';
import 'package:qolbuyim/pages/product_list_page.dart';
import 'package:qolbuyim/pages/product_page.dart';
import 'package:qolbuyim/pages/second_welcome.dart';
import 'package:qolbuyim/pages/settings_page.dart';
import 'package:qolbuyim/pages/signup_page.dart';
import 'package:qolbuyim/pages/start_page.dart';
import 'package:qolbuyim/pages/third_welcome.dart';
import 'package:qolbuyim/pages/account_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;


    switch (settings.name) {
      case WelcomePage.routeName:
        return MaterialPageRoute(builder: (context) => WelcomePage());
      case FirstWelcome.routeName:
        return MaterialPageRoute(builder: (context) => FirstWelcome());
      case SecondWelcome.routeName:
        return MaterialPageRoute(builder: (context) => SecondWelcome());
      case ThirdWelcome.routeName:
        return MaterialPageRoute(builder: (context) => ThirdWelcome());
      case AuthPage.routeName:
        return MaterialPageRoute(builder: (context) => AuthPage());
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case SignUpPage.routeName:
        return MaterialPageRoute(builder: (context) => SignUpPage());
      case MainPage.routeName:
        return MaterialPageRoute(builder: (context) => MainPage());
      case ProductPage.routeName:
        return MaterialPageRoute(builder: (context) => ProductPage());
      case CategoryPage.routeName:
        return MaterialPageRoute(builder: (context) => CategoryPage());
      case ProductListPage.routeName:
        return MaterialPageRoute(builder: (context) => ProductListPage());
      case FavouritePage.routeName:
        return MaterialPageRoute(builder: (context) => FavouritePage());
      case BasketPage.routeName:
        return MaterialPageRoute(builder: (context) => BasketPage());
      case AccountPage.routeName:
        return MaterialPageRoute(builder: (context) => AccountPage());
      case SettingsPage.routeName:
        return MaterialPageRoute(builder: (context) => SettingsPage());
        break;

    }
    return null;
  }
}