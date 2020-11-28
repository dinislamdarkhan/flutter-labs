import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qolbuyim/models/promo.dart';
import 'package:qolbuyim/utils/app_theme.dart';

class PromoWidget extends StatelessWidget {
  final Promo model;

  const PromoWidget({this.model});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Container(
            alignment: Alignment.center,
            padding: AppTheme.defaultSpace,
            height: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(2, 4),
                      blurRadius: 5,
                      spreadRadius: 2)
                ],
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppTheme.secondaryColor, AppTheme.mainColor])),
            child: Row(
              children: <Widget>[
                Container(child: Image.asset('assets/${model.promoIcon}')),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10),
                    Text('Music Box',
                        style: GoogleFonts.roboto(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            color: Colors.white)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('${model.price}' + 'T',
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                ),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                color: Colors.white)),
                        SizedBox(width: 10),
                        FlatButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          color: Colors.white,
                          child: Text('${model.salePrice}' + 'T',
                              style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  color: AppTheme.mainColor)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
