import 'package:flutter/material.dart';
import 'package:qolbuyim/utils/app_theme.dart';

Widget appBar() {
  return Container(
    padding: AppTheme.defaultSpace,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        RotatedBox(
          quarterTurns: 4,
          child: icon(Icons.sort, color: Colors.black54),
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.mainColor,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color(0xFFf8f8f8), blurRadius: 10, spreadRadius: 10),
              ],
            ),
            child: Image.asset("assets/user.png"),
          ),
        )
      ],
    ),
  );
}

Widget icon(IconData icon, {Color color = AppTheme.mainColor}) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color: AppTheme.mainColor,
        boxShadow: AppTheme.shadow),
    child: Icon(
      icon,
      color: color,
    ),
  );
}
