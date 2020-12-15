import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qolbuyim/models/data.dart';
import 'package:qolbuyim/models/product.dart';
import 'package:qolbuyim/pages/home_page.dart';
import 'package:qolbuyim/pages/main_page.dart';
import 'package:qolbuyim/utils/app_theme.dart';

class BasketPage extends StatefulWidget {
  static const routeName = '/basket';

  const BasketPage({Key key}) : super(key: key);

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  Widget _cartItems() {
    return Column(children: AppData.cartList.map((x) => _item(x)).toList());
  }

  Widget _item(Product model) {
    return Container(
      height: 80,
      child: Row(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.2,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 70,
                    width: 70,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppTheme.darkGray,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: Image.network(model.image, fit: BoxFit.contain,),
                )
              ],
            ),
          ),
          Expanded(
              child: ListTile(
                  title: Text(model.name,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      )),
                  subtitle: Row(
                    children: <Widget>[
                      Text('\$ ',
                          style: TextStyle(
                            color: AppTheme.errorTextColor,
                            fontSize: 12,
                          )),
                      Text(model.price.toString(),
                          style: TextStyle(
                            fontSize: 14,
                          )),
                    ],
                  ),
                  trailing: InkWell(
                      onTap: () {
                        setState(() {
                          AppData.cartList.removeLast();
                        });
                      },
                      child: Container(
                          width: 35,
                          height: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppTheme.mainColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.delete_outline,
                            color: AppTheme.errorTextColor,
                          )))))
        ],
      ),
    );
  }

  Widget _price() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '${AppData.cartList.length} Items',
          style: TextStyle(
            color: AppTheme.darkGray,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          '\$${getPrice()}',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget _title() {
    return Container(
        margin: AppTheme.defaultSpace,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Product Basket',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w700,
                    )),
              ],
            ),
            Spacer(),
            Icon(
              Icons.delete_outline,
              color: AppTheme.mainColor,
            )
          ],
        ));
  }

  Widget _submitButton(BuildContext context) {
    return FlatButton(
        onPressed: () {
          Navigator.pushNamed(context, MainPage.routeName);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 15),
          width: AppTheme.fullWidth(context) * .8,
          child: Text(
            'Payment',
            style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.headline6,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              color: Theme.of(context).backgroundColor,
//              foreground: Paint()..shader = AppTheme.linearGradient),
            ),
          ),
          color: AppTheme.mainColor,
        ));
  }

  double getPrice() {
    double price = 0;
    AppData.cartList.forEach((x) {
      price += x.price;
    });
    return price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: AppTheme.defaultSpace,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 50),
              _title(),
              SizedBox(height: 50),
              _cartItems(),
              Divider(
                thickness: 1,
                height: 70,
              ),
              _price(),
              SizedBox(height: 30),
              _submitButton(context),
            ],
          ),
        ),
      ),
    );
  }
}
