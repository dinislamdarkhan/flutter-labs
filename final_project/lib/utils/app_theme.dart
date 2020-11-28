import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static String appName = "Flutter Travel";

  //Colors for theme
  static const Color mainColor = Color(0xffAF8AF8);
  static const Color secondaryColor = Color(0xff7DADFA);
  static const Color darkGray = Color(0xff0F3FA);
  static const Color lightGrey = Color(0xffF0F3FA);
  static const Color yellowColor = Color(0xfffbba01);

  //Background colors
  static Color lightBackground = Color(0xFFFDFEFF);
  static Color darkBackground = Colors.black;

  //Text colors
  static const Color linkTextColor = Color(0xff2E6CE6);
  static const Color darkTextColor = Color(0xFF0A1034);
  static const Color lightTextColor = Color(0xFFFDFEFF);
  static const Color errorTextColor = Colors.red;

  //Text styling
  static TextStyle titleStyle = GoogleFonts.muli(
    fontSize: 27,
    fontWeight: FontWeight.bold,
  );

  static TextStyle logoStyle = GoogleFonts.pTMono(
    fontSize: 42,
    color: lightTextColor,
  );

  static TextStyle subLogoStyle = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    letterSpacing: 6,
    color: lightTextColor,
  );

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static List<BoxShadow> shadow = <BoxShadow>[
    BoxShadow(color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 15),
  ];

  static EdgeInsets defaultSpace =
      const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets horizontalSpace =
      const EdgeInsets.symmetric(horizontal: 10);
  static EdgeInsets verticalSpace = const EdgeInsets.symmetric(vertical: 10);

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBackground,
//    primaryColor: mainColor,
//    accentColor: mainColor,
//    cursorColor: mainColor,
//    scaffoldBackgroundColor: lightBackground,
    fontFamily: 'Roboto',
    textTheme: TextTheme(
        bodyText1: TextStyle(
            color: darkTextColor, fontSize: 16.0, fontWeight: FontWeight.w800)),
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: darkTextColor,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
//      iconTheme: IconThemeData(
//        color: lightAccent,
//      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
//    brightness: Brightness.dark,
//    backgroundColor: darkBackground,
//    primaryColor: mainColor,
//    accentColor: mainColor,
    scaffoldBackgroundColor: darkBackground,
    cursorColor: mainColor,
    fontFamily: 'Roboto',
    textTheme:
        TextTheme(bodyText1: TextStyle(color: lightTextColor, fontSize: 16.0)),
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: darkTextColor,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
//      iconTheme: IconThemeData(
//        color: darkAccent,
//      ),
    ),
  );
}
