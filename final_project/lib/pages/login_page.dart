import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qolbuyim/pages/main_page.dart';
import 'package:qolbuyim/pages/signup_page.dart';
import 'package:qolbuyim/services/authentication_service.dart';
import 'package:qolbuyim/utils/app_theme.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String error = '';

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    theme.copyWith(accentColor: Colors.white, focusColor: Colors.white);
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
        onTap: () => Navigator.pushNamed(context, SignUpPage.routeName),
        child: Text(
          'Don’t have an account? Sign up',
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
        margin: EdgeInsets.all(10.0),
        child: TextFormField(
            controller: emailController,
            cursorColor: Colors.white,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: new InputDecoration(
              labelText: "Enter Email",
              fillColor: Colors.white,
              focusColor: Colors.white,
              hoverColor: Colors.white,
              labelStyle: TextStyle(
                color: Colors.white,
              ),
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
        margin: EdgeInsets.all(10.0),
        child: TextFormField(
            obscureText: true,
            controller: passwordController,
            cursorColor: Colors.white,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: new InputDecoration(
              labelText: "Enter Password",
              focusColor: Colors.white,
              hoverColor: Colors.white,
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: new BorderSide(
                  color: Colors.white,
                ),
              ),
              fillColor: Colors.white,
            )),
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

    Widget _subtitle() {
      return InkWell(
        child: Text(
          'Login',
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

    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Error"),
            content: new Text("Wrong password or login"),
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
          dynamic result =
          await _auth.signInWithEmailAndPassword(emailController.text.trim(), passwordController.text.trim());
          if (result == null) {
            setState(() {
              _showDialog();
              error = 'Wrong email or password';
            });
          } else {
            print(result.toString());
            Navigator.pushNamed(context, MainPage.routeName);
          }
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.white,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 15),
          width: AppTheme.fullWidth(context) * .8,
          child: Text(
            'Login',
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
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [AppTheme.secondaryColor, AppTheme.mainColor])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _subtitle(),
            SizedBox(
              height: 200,
            ),
            _email(),
            _password(),
            SizedBox(
              height: 30,
            ),
            _button(),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
            ),
            _alternateLogin(),
            SizedBox(
              height: 30,
            ),
            _slider(),
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
