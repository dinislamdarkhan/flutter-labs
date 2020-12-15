import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qolbuyim/models/product.dart';
import 'package:qolbuyim/pages/product_page.dart';
import 'package:qolbuyim/utils/app_theme.dart';

class ProductCard extends StatefulWidget {
  final BuildContext context;
  final DocumentSnapshot document;
  ProductCard({Key key,this.context, this.document}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isSelected = false;
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ProductPage.routeName, arguments: widget.document);
        setState(() {
          // model.isSelected = !model.isSelected;
          //   AppData.productList.forEach((x) {
          //     if (x.id == model.id && x.name == model.name) {
          //       return;
          //     }
          //     x.isSelected = false;
          //   });
          //   var m = AppData.productList
          //       .firstWhere((x) => x.id == model.id && x.name == model.name);
          //   m.isSelected = !m.isSelected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: !isSelected ? 20 : 0),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
                left: 0,
                top: 0,
                child: IconButton(
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked
                          ? AppTheme.errorTextColor
                          : AppTheme.lightTextColor,
                    ),
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    })),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: isSelected ? 15 : 0),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: AppTheme.mainColor.withAlpha(40),
                    ),
                    Image.network(widget.document['image'], height: 100,)
                  ],
                ),
                // SizedBox(height: 5),
                Text(widget.document['name'],
                    style: TextStyle(
                      fontSize: isSelected ? 16 : 14,
                      fontWeight: FontWeight.bold,
                    )),
//                Text(
//                  model.category,
//                  style: TextStyle(
//                    fontSize: model.isSelected ? 14 : 12,
//                    color: AppTheme.mainColor,
//                    fontWeight: FontWeight.bold,
//                  ),
//                ),
                Text(
                  widget.document['price'].toString(),
                  style: TextStyle(
                    fontSize: isSelected ? 18 : 16,
                    color: AppTheme.mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
