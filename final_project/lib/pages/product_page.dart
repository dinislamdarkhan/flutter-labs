import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qolbuyim/models/data.dart';
import 'package:qolbuyim/models/product.dart';
import 'package:qolbuyim/pages/basket_page.dart';
import 'package:qolbuyim/utils/app_theme.dart';

class ProductPage extends StatefulWidget {
  static const routeName = '/product';

  ProductPage({Key key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  String checkText = "Small";
  bool isLiked = false;
  int colorID = 0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }



  Widget _appBar(DocumentSnapshot args, BuildContext context) {

    return Container(
      padding: AppTheme.defaultSpace,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: _icon(Icons.arrow_back_ios,
                color: Colors.black54, size: 15, padding: 12, isOutLine: true),
          ),
          InkWell(
            onTap: () {

              setState(() {
                isLiked = !isLiked;
                if(isLiked) {
                  AppData.cartList.add(Product(
                      id: args['id'],
                      name: args['name'],
                      price: args['price'],
                      isSelected: true,
                      isliked: true,
                      image: args['image'],
                      category: args['category']));
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Product added in favourite!'), duration: Duration(seconds: 1),));
                }
                else{
                  AppData.cartList.removeWhere((element) => element.id == args['id']);
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Product removed from favourite!'), duration: Duration(seconds: 1),));
                }
              });
            },
            child: _icon(isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? AppTheme.errorTextColor : AppTheme.darkGray,
                size: 15,
                padding: 12,
                isOutLine: false),
          )
        ],
      ),
    );
  }

  Widget _icon(IconData icon,
      {Color color = AppTheme.darkGray,
      double size = 20,
      double padding = 10,
      bool isOutLine = false}) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(padding),
      // margin: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(
            color: AppTheme.darkGray,
            style: isOutLine ? BorderStyle.solid : BorderStyle.none),
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color:
            isOutLine ? Colors.transparent : Theme.of(context).backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color(0xfff8f8f8),
              blurRadius: 5,
              spreadRadius: 10,
              offset: Offset(5, 5)),
        ],
      ),
      child: Icon(icon, color: color, size: size),
    );
  }

  Widget _productImage(DocumentSnapshot args) {
    return AnimatedBuilder(
      builder: (context, child) {
        return AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: animation.value,
          child: child,
        );
      },
      animation: animation,
      child: Container(
        width: 250.0,
        height: 250.0,
        alignment: Alignment.center,
        child: Image.network(args['image']),
        ),
    );
  }

  Widget _categoryWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      width: AppTheme.fullWidth(context),
      height: 80,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              AppData.showThumbnailList.map((x) => _thumbnail(x)).toList()),
    );
  }

  Widget _thumbnail(String image) {
    return AnimatedBuilder(
        animation: animation,
        //  builder: null,
        builder: (context, child) => AnimatedOpacity(
              opacity: animation.value,
              duration: Duration(milliseconds: 500),
              child: child,
            ),
        child: Container(
          height: 40,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppTheme.lightGrey,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(13),
            ),
            // color: Theme.of(context).backgroundColor,
          ),
          child: Image.asset(image),
        ));
  }

  Widget _detailWidget(DocumentSnapshot args) {
    return DraggableScrollableSheet(
      maxChildSize: .8,
      initialChildSize: .53,
      minChildSize: .53,
      builder: (context, scrollController) {
        return Container(
          padding: AppTheme.defaultSpace,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: BoxDecoration(
                        color: AppTheme.lightGrey,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(args['name'], style: TextStyle(fontSize: 25)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("\$ ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppTheme.errorTextColor,
                                  )),
                              Text("${args['price']}",
                                  style: TextStyle(
                                    fontSize: 25,
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.star,
                                  color: AppTheme.yellowColor, size: 17),
                              Icon(Icons.star,
                                  color: AppTheme.yellowColor, size: 17),
                              Icon(Icons.star,
                                  color: AppTheme.yellowColor, size: 17),
                              Icon(Icons.star,
                                  color: AppTheme.yellowColor, size: 17),
                              Icon(Icons.star_border, size: 17),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _availableSize(),
                SizedBox(
                  height: 20,
                ),
                _availableColor(),
                SizedBox(
                  height: 20,
                ),
                _description(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _availableSize() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Available Size",
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            sizeWidget("Small",
                isSelected: checkText == "Small" ? true : false),
            sizeWidget("Medium",
                isSelected: checkText == "Medium" ? true : false),
            sizeWidget("Large",
                isSelected: checkText == "Large" ? true : false),
            sizeWidget("Extra Large",
                isSelected: checkText == "Extra Large" ? true : false),
          ],
        )
      ],
    );
  }

  Widget sizeWidget(String text,
      {Color color = AppTheme.lightGrey, bool isSelected}) {
    return InkWell(
      onTap: () {
        setState(() {
          checkText = text;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
              color: AppTheme.lightGrey,
              style: !isSelected ? BorderStyle.solid : BorderStyle.none),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: isSelected
              ? AppTheme.mainColor
              : Theme.of(context).backgroundColor,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: isSelected
                ? Theme.of(context).backgroundColor
                : AppTheme.mainColor,
          ),
        ),
      ),
    );
  }

  Widget _availableColor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Available Color",
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _colorWidget(0, AppTheme.yellowColor,
                isSelected: colorID == 0 ? true : false),
            SizedBox(
              width: 30,
            ),
            _colorWidget(1, AppTheme.mainColor,
                isSelected: colorID == 1 ? true : false),
            SizedBox(
              width: 30,
            ),
            _colorWidget(2, Colors.black,
                isSelected: colorID == 2 ? true : false),
            SizedBox(
              width: 30,
            ),
            _colorWidget(3, AppTheme.errorTextColor,
                isSelected: colorID == 3 ? true : false),
            SizedBox(
              width: 30,
            ),
            _colorWidget(4, AppTheme.secondaryColor,
                isSelected: colorID == 4 ? true : false),
          ],
        )
      ],
    );
  }

  Widget _colorWidget(int id, Color color, {bool isSelected = false}) {
    return InkWell(
      onTap: () => setState(() {
        colorID = id;
      }),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: color.withAlpha(150),
        child: isSelected
            ? Icon(
                Icons.check_circle,
                color: color,
                size: 40,
              )
            : CircleAvatar(radius: 0, backgroundColor: color),
      ),
    );
  }

  Widget _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Description",
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        SizedBox(height: 20),
        Text(AppData.description),
      ],
    );
  }

  FloatingActionButton _floatingButton(DocumentSnapshot args) {
    return FloatingActionButton(
      onPressed: () {
        AppData.cartList.add(Product(
            id: args['id'],
            name: args['name'],
            price: args['price'],
            isSelected: true,
            isliked: false,
            image: args['image'],
            category: args['category']));
        Navigator.pushNamed(context, BasketPage.routeName);
      },
      backgroundColor: AppTheme.mainColor,
      child:
          Icon(Icons.shopping_basket, color: Theme.of(context).backgroundColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    final DocumentSnapshot args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      floatingActionButton: _floatingButton(args),
      extendBody: true,
      body: Builder(
        builder: (context) =>
        SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(0xfffbfbfb),
                Color(0xfff7f7f7),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    _appBar(args, context),
                    _productImage(args),
                    _categoryWidget(),
                  ],
                ),
                _detailWidget(args)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
