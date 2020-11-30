import 'package:flutter/material.dart';

Widget appBar(appBarText) {
  return AppBar(
    toolbarHeight: 65.0,
    title: Align(
        alignment: Alignment.bottomLeft,
        child: Text(appBarText,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25.0))),
    centerTitle: true,
  );
}
