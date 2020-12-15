import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qolbuyim/models/user.dart';
import 'package:qolbuyim/pages/main_page.dart';
import 'package:qolbuyim/pages/start_page.dart';
import 'package:qolbuyim/services/authentication_service.dart';
import 'package:qolbuyim/utils/app_theme.dart';
import 'package:qolbuyim/utils/route_generator.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          initialRoute: AuthService().user == null ? WelcomePage.routeName : MainPage.routeName,
          onGenerateRoute: RouteGenerator.generateRoute
    ),
         );
  }
}
