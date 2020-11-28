import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qolbuyim/utils/app_theme.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: AppTheme.fullWidth(context),
        height: AppTheme.fullHeight(context),
        padding: EdgeInsets.all(40),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            _button(),
        _question("1", "categWory", false),
        SizedBox(
          height: 30,
        ),
          ],
        ),
      ),
    );
  }


  Widget _button() {
    return FlatButton(
      onPressed: () {
        Navigator.pushNamed(context, '/second_welcome');
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
              textStyle: Theme
                  .of(context)
                  .textTheme
                  .headline4,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              color: Colors.white,
            ),
          )),
    );
  }
  Widget _question(String text, String category, bool onClick){
    return InkWell(
      onTap: () => setState(() {
        onClick = true;
      }),
      child: Container(
        alignment: Alignment.center,
        padding: AppTheme.defaultSpace,
        decoration: BoxDecoration(
            color: onClick ? AppTheme.mainColor : AppTheme.lightBackground,
            border: Border.all(
              color: AppTheme.mainColor,
              width: 2,
            ),

            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Text(
          text,
          style: TextStyle(
            color: onClick ? AppTheme.lightTextColor : AppTheme.darkTextColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

  }
}
