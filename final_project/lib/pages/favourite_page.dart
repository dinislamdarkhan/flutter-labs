import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qolbuyim/models/data.dart';
import 'package:qolbuyim/utils/app_theme.dart';
import 'package:qolbuyim/widgets/favourite/product_cart.dart';
import 'package:qolbuyim/widgets/home/product.dart';
import 'package:qolbuyim/widgets/home/product_card.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key key}) : super(key: key);
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  Widget _title(){
    return Center(
      child: Container(
        margin: AppTheme.defaultSpace,
        child: Text(
          'Favourites',
          style: AppTheme.titleStyle,
        ),
      ),
    );
  }
  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            child: Text('Hello From Modal Bottom Sheet'),
            padding: EdgeInsets.all(40.0),
          );
        });
  }
  Widget _filterButton(){
    return InkWell(

      child: Container(
        child: Text(
            "Filter"
        ),
        height: 10,
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.mainColor, width: 3),
          color: AppTheme.lightBackground,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightGrey,
      body: SafeArea(
        child:
            GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    children:
                      AppData.cartList.map((favourites) => ProductCart(model: favourites,)).toList()
            ),
        ),
    );
  }
}




