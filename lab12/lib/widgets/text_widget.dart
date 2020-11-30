import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textWidget(text,
    {fontSize = 18.0, weight = FontWeight.w400, color = Colors.black}) {
  return Container(
      child: Text(text,
          style: GoogleFonts.roboto(
            fontSize: fontSize,
            fontWeight: weight,
            fontStyle: FontStyle.normal,
            color: color,
          )));
}
