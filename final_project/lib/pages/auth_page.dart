import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qolbuyim/utils/app_theme.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Container(
          child: Image.asset(
        'assets/Ellipse 8.png',
        width: 200,
      ));
    }

    final Shader linearGradient = LinearGradient(
      colors: <Color>[AppTheme.secondaryColor, AppTheme.mainColor],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    Widget _skip() {
      return InkWell(
        onTap: () => Navigator.pushNamed(context, '/home'),
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
        onTap: () => Navigator.pushNamed(context, '/login'),
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

    Widget _slider() {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  color: AppTheme.mainColor.withOpacity(0.7),
                  shape: BoxShape.circle),
            ),
            Container(
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  color: AppTheme.mainColor.withOpacity(0.7),
                  shape: BoxShape.circle),
            ),
            Container(
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                color: AppTheme.mainColor.withOpacity(0.7),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: AppTheme.mainColor, shape: BoxShape.circle),
            ),
          ],
        ),
      );
    }

    Widget _button() {
      return FlatButton(
        onPressed: () {
          Navigator.pushNamed(context, '/sign_up');
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

    Widget _buttonGoogle() {
      return FlatButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.white,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 15),
          width: AppTheme.fullWidth(context) * .8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset('assets/Google icon.png'),
              ),
              Text(
                'Connect with Google',
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: Color(0xff555555),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
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
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [AppTheme.secondaryColor, AppTheme.mainColor])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _logo(),
            SizedBox(
              height: 30,
            ),
            _button(),
            SizedBox(
              height: 30,
            ),
            _buttonGoogle(),
            SizedBox(
              height: 30,
            ),
            _alternateLogin(),
            SizedBox(
              height: 30,
            ),
            _slider(),
            SizedBox(
              height: 70,
            ),
            _skip(),
//            _facebook(),
          ],
        ),
      ),
    );
  }
}
