import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qolbuyim/pages/start_page.dart';
import 'package:qolbuyim/services/authentication_service.dart';
import 'package:qolbuyim/utils/app_theme.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  static const routeName = '/user';

  AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () async {
                    await _auth.signOut();
                    Navigator.pushNamed(context, WelcomePage.routeName);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: AppTheme.mainColor,
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      width: AppTheme.fullWidth(context) * .6,
                      child: Text(
                        'Logout',
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                        ),
                      )),
                )
              ])),
    );
  }
}
