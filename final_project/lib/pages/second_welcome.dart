import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qolbuyim/utils/app_theme.dart';

// ignore: camel_case_types
class SecondWelcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _logo() {
      return Container(
          child: Image.asset(
        'assets/undraw_mobile_wireframe.png',
        width: 400,
      ));
    }

    Widget _skip() {
      return InkWell(
        child: Text(
          'Skip for now',
          style: GoogleFonts.roboto(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: AppTheme.mainColor,
          ),
        ),
      );
    }

    Widget _subtitle() {
      return Container(
        child: Text(
          'Handmade assortment',
          style: GoogleFonts.roboto(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 24,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.normal,
            color: AppTheme.mainColor,
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
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: AppTheme.mainColor, shape: BoxShape.circle),
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
          ],
        ),
      );
    }

    Widget _button() {
      return FlatButton(
        onPressed: () {
          Navigator.pushNamed(context, '/third_welcome');
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: AppTheme.mainColor,
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 15),
            width: AppTheme.fullWidth(context) * .6,
            child: Text(
              'Next',
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.white,
              ),
            )),
      );
    }

    return Scaffold(
      body: Container(
        height: AppTheme.fullHeight(context),
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
//            _signUpButton(),
            _logo(),
            SizedBox(
              height: 50,
            ),
            _subtitle(),
            SizedBox(
              height: 30,
            ),
            _slider(),
            SizedBox(
              height: 90,
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
