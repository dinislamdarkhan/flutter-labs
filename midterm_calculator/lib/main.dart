import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color bgColor = Color(0xff000000);
  Color fontColor = Color(0xffFFFFFF);
  Color digitBtnColor = Color(0xffA5A5A5);
  Color funcBtnColor = Color(0xff424242);
  Color operatorBtnColor = Color(0xffF3A23E);
  String displayNumber = '0';
  String operator = '';
  double curNumber;
  bool calculated = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    double calculate(value, func, next) {
      if (value != null && !calculated && operator != '') {
        next = double.parse(next);
        if (operator == '+')
          next = value + next;
        else if (operator == '-')
          next = value - next;
        else if (operator == '/')
          try {
            next = value / next;
          } catch (e) {}
        else if (operator == '*')
          next = value * next;
        else if (operator == '%') next = value * next / 100;

        if (next.toString().length > 8)
          displayNumber = next.toInt() == next
              ? next.toStringAsExponential(3)
              : next.toStringAsFixed(3);
        else
          try {
            displayNumber = next.toInt() == next
                ? next.toInt().toString()
                : next.toString();
          } catch (e) {
            displayNumber = next.toString();
          }
        calculated = true;
        operator = func;
        return next;
      } else if (func == '=')
        return value;
      else {
        operator = func;
        displayNumber = '0';
        return double.parse(next);
      }
    }

    Widget _button(text, color, value) {
      return ButtonTheme(
          height: height * .131,
          child: RaisedButton(
              onPressed: () {
                setState(() {
                  if (value is int) {
                    if (displayNumber == '0' || calculated) displayNumber = '';
                    if (displayNumber.length < 8)
                      displayNumber += value.toString();
                    calculated = false;
                  } else if (value is String) {
                    if (value == 'c') {
                      displayNumber = '0';
                      operator = '';
                      curNumber = null;
                    } else if (value == '.')
                      displayNumber = displayNumber + '.';
                    else if (value == '+/-')
                      displayNumber = '-' + displayNumber;
                    else
                      curNumber = calculate(curNumber, value, displayNumber);
                  }
                });
              },
              color: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              child: Text(text,
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 38.0))));
    }

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Column(children: <Widget>[
          Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(5),
              height: 250,
              child: Text(displayNumber,
                  style: GoogleFonts.lato(
                      color: fontColor,
                      fontSize: 86.0,
                      fontWeight: FontWeight.w300))),
          GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              shrinkWrap: true,
              children: <Widget>[
                _button('c', funcBtnColor, 'c'),
                _button('+/-', funcBtnColor, '+/-'),
                _button('%', funcBtnColor, '%'),
                _button('/', operatorBtnColor, '/'),
                _button('7', digitBtnColor, 7),
                _button('8', digitBtnColor, 8),
                _button('9', digitBtnColor, 9),
                _button('x', operatorBtnColor, '*'),
                _button('4', digitBtnColor, 4),
                _button('5', digitBtnColor, 5),
                _button('6', digitBtnColor, 6),
                _button('-', operatorBtnColor, '-'),
                _button('1', digitBtnColor, 1),
                _button('2', digitBtnColor, 2),
                _button('3', digitBtnColor, 3),
                _button('+', operatorBtnColor, '+'),
              ]),
          SizedBox(height: 2.5),
          Row(children: <Widget>[
            Expanded(flex: 502, child: _button('0', digitBtnColor, 0)),
            SizedBox(width: 2),
            Expanded(flex: 249, child: _button('.', digitBtnColor, '.')),
            SizedBox(width: 2),
            Expanded(flex: 249, child: _button('=', operatorBtnColor, '=')),
          ])
        ])));
  }
}
