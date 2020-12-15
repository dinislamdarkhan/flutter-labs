import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qolbuyim/pages/first_welcome.dart';
import 'package:qolbuyim/pages/main_page.dart';
import 'package:qolbuyim/utils/app_theme.dart';

// ignore: camel_case_types
class WelcomePage extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Container(
          child: Image.asset(
        'assets/Ellipse 8.png',
        width: 300,
      ));
    }

    final Shader linearGradient = LinearGradient(
      colors: <Color>[AppTheme.secondaryColor, AppTheme.mainColor],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    Widget _title() {
      return InkWell(
        child: Text(
          'QOLBUYIM',
          style: GoogleFonts.pTMono(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 42,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            color: Colors.white,
          ),
        ),
      );
    }

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

    Widget _subtitle() {
      return InkWell(
        child: Text(
          'HANDMADE MARKET',
          style: GoogleFonts.roboto(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            letterSpacing: 6,
            color: Colors.white,
          ),
        ),
      );
    }

    Widget _button() {
      return FlatButton(
        onPressed: () {
          Navigator.pushNamed(context, FirstWelcome.routeName);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.white,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 15),
          width: AppTheme.fullWidth(context) * .8,
          child: Text(
            'Lets start',
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
      body: Container(
        padding: EdgeInsets.all(70),
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
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [Color(0xFF7DADFA), Color(0xFFAF8AF8)])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            _title(),
            _subtitle(),
            SizedBox(
              height: 50,
            ),
//            _signUpButton(),
            _logo(),
            SizedBox(
              height: 30,
            ),
            _button(),
            SizedBox(
              height: 30,
            ),
            _skip(),
//            _facebook(),
          ],
        ),
      ),
    );
  }
}
