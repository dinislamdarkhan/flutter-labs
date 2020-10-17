import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Center(
            child: Text(
          'Hello Flutter',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              decoration: TextDecoration.none,
              color: Color(0xffE35646)),
        )));
  }
}
