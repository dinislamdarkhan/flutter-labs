import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qolbuyim/models/data.dart';
import 'package:qolbuyim/models/product.dart';
import 'package:qolbuyim/services/database.dart';
import 'package:qolbuyim/utils/app_theme.dart';
import 'package:qolbuyim/widgets/app_bar.dart';
import 'package:qolbuyim/widgets/home/product_card.dart';
import 'package:qolbuyim/widgets/home/promo_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  Widget _categoryWidget() {
//    return Container(
//      margin: EdgeInsets.symmetric(vertical: 10),
//      width: AppTheme.fullWidth(context),
//      height: 80,
//      child: ListView(
//          scrollDirection: Axis.horizontal,
//          children: AppData.categoryList
//              .map((category) => ProductIcon(
//            model: category,
//          ))
//              .toList()),
//    );
//  }

  Widget _productWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: AppTheme.fullWidth(context) * .7,
      child: StreamBuilder(
        stream: Firestore.instance.collection('products').snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) return const Text("Loading");
          return GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 4/3,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0),
              padding: EdgeInsets.only(left: 20),
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) => ProductCard(context: context, document: snapshot.data.documents[index]));
        }
      ),
    );
  }

  Widget _promoList() {
    return Container(
      margin: AppTheme.verticalSpace,
      width: AppTheme.fullWidth(context),
      height: AppTheme.fullWidth(context) * .3,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 0.3,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0),
        scrollDirection: Axis.horizontal,
        padding: AppTheme.horizontalSpace,
        children: AppData.promoList
            .map((value) => PromoWidget(
                  model: value,
                ))
            .toList(),
      ),
    );
  }

  Widget _main_button() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      width: AppTheme.fullWidth(context) * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            color: Color(0xffE0ECF8),
            child: Icon(
              Icons.list,
              color: AppTheme.mainColor,
              size: 35.0,
            ),
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
          ),
          FlatButton(
            onPressed: () {},
            color: Color(0xffE0ECF8),
            child: Icon(
              Icons.star_border,
              color: AppTheme.mainColor,
              size: 35.0,
            ),
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
          ),
          FlatButton(
            onPressed: () {},
            color: Color(0xffE0ECF8),
            child: Icon(
              Icons.card_giftcard,
              color: AppTheme.mainColor,
              size: 35.0,
            ),
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
          ),
          FlatButton(
            onPressed: () {},
            color: Color(0xffE0ECF8),
            child: Icon(
              Icons.people_outline,
              color: AppTheme.mainColor,
              size: 35.0,
            ),
            padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
          ),
        ],
      ),
    );
  }

  Widget _search() {
    return Container(
      margin: AppTheme.defaultSpace,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(100),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Products",
                    hintStyle: TextStyle(fontSize: 12),
                    contentPadding:
                        EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                    prefixIcon: Icon(Icons.search, color: Colors.black54)),
              ),
            ),
          ),
          SizedBox(width: 20),
          icon(Icons.filter_list, color: Colors.black54),
        ],
      ),
    );
  }

  Widget salesTitle() {
    return Center(
      child: Container(
        margin: AppTheme.defaultSpace,
        child: Text(
          'Hello World',
          style: AppTheme.titleStyle,
        ),
      ),
    );
  }

  Widget _salesCard() {
    return Container(
      margin: AppTheme.defaultSpace,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0xffEAF0FC),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(1.0)),
                  ),
                  child: Text(
                    '-50%',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Color(0xff2E6CE6),
                    ),
                  ),
                ),
                Container(
                  width: AppTheme.fullWidth(context) * .42,
                  child: Image.asset(
                    'assets/sale1.png',
                    width: AppTheme.fullWidth(context) * .42,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Leather Bag',
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Color(0xff0A1034),
                      ),
                    )),
              ],
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0xffEAF0FC),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(1.0)),
                  ),
                  child: Text(
                    '-50%',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: Color(0xff2E6CE6),
                    ),
                  ),
                ),
                Container(
                  width: AppTheme.fullWidth(context) * .42,
                  child: Image.asset(
                    'assets/sale2.png',
                    width: AppTheme.fullWidth(context) * .42,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.all(5),
                    child: Text(
                      'Blanket Scarf',
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Color(0xff0A1034),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _search(),
        _promoList(),
        _main_button(),
        salesTitle(),
        _salesCard(),
//        _categoryWidget(),
      _title("Recommended"),
        _productWidget(),
        _title("Popular"),
        _productWidget(),
//        BrewList()
      ],
    );
  }
}

Widget _title(String s) {
  return Container(
    margin: AppTheme.defaultSpace,
    child: Text(
      s,
      style: AppTheme.titleStyle,
    ),
  );
}
