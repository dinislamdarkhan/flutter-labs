import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qolbuyim/pages/product_list_page.dart';
import 'package:qolbuyim/utils/app_theme.dart';

Widget productCard(BuildContext context, DocumentSnapshot document){
  return InkWell(
  onTap: () => {
    Navigator.pushNamed(context, ProductListPage.routeName, arguments: document)
  },
    child: Container(
      decoration: BoxDecoration(
      color: AppTheme.lightBackground,
      border: Border.all(color: AppTheme.mainColor),

      borderRadius: BorderRadius.all(Radius.circular(5)),
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Color(0xfffff8f8), blurRadius: 15, spreadRadius: 10),
      ],
    ),
      margin: AppTheme.defaultSpace,
      padding: AppTheme.horizontalSpace,
      width: AppTheme.fullWidth(context) * 0.45,
      height: AppTheme.fullHeight(context) * 0.23,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(document['image'], width: 130, height: 100,),
          SizedBox(height: 20,),
          Text(
            document['name'],
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),

          ),
          SizedBox(height: 10,),
      Text(
        "${document['price']}T",
        style: GoogleFonts.roboto(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: AppTheme.linkTextColor,
        ),
      ),
        ],
      ),
    ),
  );
}