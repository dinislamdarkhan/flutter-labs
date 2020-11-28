import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qolbuyim/services/auth.dart';
import 'package:qolbuyim/utils/app_theme.dart';

// ignore: camel_case_types
class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  AuthService _auth = AuthService();

  String email = '';

  String password = '';

  String name = '';

  @override
  Widget build(BuildContext context) {
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

    Widget _email() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: TextFormField(
            onChanged: (val) {
              setState(() => email = val);
            },
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
            onChanged: (val) {
              setState(() => password = val);
            },
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
            onChanged: (val) {
              setState(() => name = val);
            },
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

    Widget _button() {
      return FlatButton(
        onPressed: () async {
          dynamic result =
              await _auth.signupWithEmailAndPassword(email, password, name);

          if (result == null) {
            print('error');
          } else {
            print(result.toString());
            Navigator.pushNamed(context, '/home');
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
