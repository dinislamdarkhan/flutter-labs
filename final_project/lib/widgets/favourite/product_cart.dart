import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qolbuyim/models/product.dart';
import 'package:qolbuyim/utils/app_theme.dart';

class ProductCart extends StatefulWidget {
  final Product model;
  ProductCart({Key key,this.model}) : super(key: key);

  @override
  _ProductCartState createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  bool isSelected = false;
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          Stream<QuerySnapshot> snaps = Firestore.instance.collection('products').where('id', isEqualTo: widget.model.id).snapshots();
          snaps.listen((QuerySnapshot data) {
            List<DocumentSnapshot> sn = data.documents;
            DocumentSnapshot d = sn.elementAt(0);
            Navigator.of(context).pushNamed('/detail', arguments: d);
          });
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
                    Image.network(widget.model.image, height: 100,)
                  ],
                ),
                // SizedBox(height: 5),
                Text(widget.model.name,
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
                  widget.model.price.toString(),
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
