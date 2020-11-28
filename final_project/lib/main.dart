import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qolbuyim/models/user.dart';
import 'package:qolbuyim/pages/after_reg.dart';
import 'package:qolbuyim/pages/auth_page.dart';
import 'package:qolbuyim/pages/basket_page.dart';
import 'package:qolbuyim/pages/category_page.dart';
import 'package:qolbuyim/pages/favourite_page.dart';
import 'package:qolbuyim/pages/first_welcome.dart';
import 'package:qolbuyim/pages/login_page.dart';
import 'package:qolbuyim/pages/main.dart';
import 'package:qolbuyim/pages/product_list_page.dart';
import 'package:qolbuyim/pages/product_page.dart';
import 'package:qolbuyim/pages/second_welcome.dart';
import 'package:qolbuyim/pages/settings_page.dart';
import 'package:qolbuyim/pages/signup_page.dart';
import 'package:qolbuyim/pages/start_page.dart';
import 'package:qolbuyim/pages/third_welcome.dart';
import 'package:qolbuyim/pages/user_page.dart';
import 'package:qolbuyim/services/auth.dart';
import 'package:qolbuyim/utils/app_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          initialRoute: AuthService().user == null ? '/' : '/home',
          routes: {
            '/': (context) => WelcomePage(),
            '/first_welcome': (context) => FirstWelcome(),
            '/second_welcome': (context) => SecondWelcome(),
            '/third_welcome': (context) => ThirdWelcome(),
            '/auth': (context) => AuthPage(),
            '/login': (context) => LoginPage(),
            '/sign_up': (context) => SignUpPage(),
            '/home': (context) => MainPage(),
            '/category': (context) => CategoryPage(),
            '/basket': (context) => BasketPage(),
            '/user_page': (context) => AccountPage(),
            //          '/favourite': (context) => ChooseLocation(),
            '/settings': (context) => SettingsPage(),
            //          '/chat': (context) => ChooseLocation(),
            //          '/product': (context) => ChooseLocation(),
            '/detail': (context) => ProductPage(),
            //          '/welcome': (context) => ChooseLocation(),
            '/after_reg': (context) =>QuestionPage(),
            '/product_list': (context) => ProductListPage(),
            '/favourite': (context) => FavouritePage(),
          }),
    );
  }
}
