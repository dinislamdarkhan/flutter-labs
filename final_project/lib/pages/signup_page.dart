import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:provider/provider.dart';
import 'package:qolbuyim/pages/login_page.dart';
import 'package:qolbuyim/pages/main_page.dart';
import 'package:qolbuyim/services/authentication_service.dart';
import 'package:qolbuyim/utils/app_theme.dart';

// ignore: camel_case_types
class SignUpPage extends StatefulWidget {
  static const routeName = '/sign_up';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  AuthService _auth = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController secondPasswordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = LinearGradient(
      colors: <Color>[AppTheme.secondaryColor, AppTheme.mainColor],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    Widget _skip() {
      return InkWell(
        onTap: () => Navigator.pushNamed(context, MainPage.routeName),
        child: Text(
          'Skip for now',
          style: GoogleFonts.roboto(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: Colors.white,
          ),
        ),
      );
    }

    Widget _alternateLogin() {
      return InkWell(
        onTap: () => Navigator.pushNamed(context, LoginPage.routeName),
        child: Text(
          'Already have an account ? Login',
          style: GoogleFonts.roboto(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: Color(0xff2E6CE6),
          ),
        ),
      );
    }

    Widget _email() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
            controller: emailController,
            decoration: new InputDecoration(
              labelText: "Enter Email",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: new BorderSide(),
              ),
              //fillColor: Colors.green
            )),
      );
    }

    Widget _password() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
            obscureText: true,
            controller: passwordController,
            cursorColor: Colors.white,
            decoration: new InputDecoration(
              labelText: "Enter Password",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: new BorderSide(),
              ),
            )),
      );
    }

    Widget repeatPassword() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
            obscureText: true,
            controller: secondPasswordController,
            decoration: new InputDecoration(
              labelText: "Repeat Password",
              focusColor: Colors.white,
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: new BorderSide(),
              ),
            )),
      );
    }

    Widget _name() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
            controller: nameController,
            decoration: new InputDecoration(
              labelText: "Enter Full Name",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: new BorderSide(),
              ),
              //fillColor: Colors.green
            )),
      );
    }

    Widget _subtitle() {
      return InkWell(
        child: Text(
          'Create new account',
          style: GoogleFonts.roboto(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 24,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.normal,
            color: Colors.white,
          ),
        ),
      );
    }

    void _showDialog(text) {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Error"),
            content: new Text(text),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Widget _button() {
      return FlatButton(
        onPressed: () async {
          if(secondPasswordController.text.trim() == passwordController.text.trim()){
            dynamic result =
            await _auth.signupWithEmailAndPassword(emailController.text.trim(), passwordController.text.trim(), nameController.text.trim());

            if (result == null) {
              _showDialog("Email already exists");
            } else {
              print(result.toString());
              Navigator.pushNamed(context, MainPage.routeName);
            }
          } else{
            _showDialog("Password not equal");
          }
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.white,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 15),
          width: AppTheme.fullWidth(context) * .8,
          child: Text(
            'Create new account',
            style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                foreground: Paint()..shader = linearGradient),
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: AppTheme.fullWidth(context),
        height: AppTheme.fullHeight(context),
        padding: EdgeInsets.all(40),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppTheme.secondaryColor, AppTheme.mainColor])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _subtitle(),
            SizedBox(
              height: 60,
            ),
            _name(),
            _email(),
            _password(),
            repeatPassword(),
            SizedBox(
              height: 30,
            ),
            _button(),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 10,
            ),
            _alternateLogin(),
            SizedBox(
              height: 50,
            ),
            _skip(),
//            _facebook(),
          ],
        ),
      ),
    );
  }
}
