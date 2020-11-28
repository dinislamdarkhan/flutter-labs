import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:qolbuyim/pages/basket_page.dart';
import 'package:qolbuyim/pages/category_page.dart';
import 'package:qolbuyim/pages/favourite_page.dart';
import 'package:qolbuyim/pages/home_page.dart';
import 'package:qolbuyim/pages/settings_page.dart';
import 'package:qolbuyim/utils/app_theme.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();

  final List<Widget> pages = [
    HomePage(
      key: PageStorageKey('Page1'),
    ),
    CategoryPage(
      key: PageStorageKey('Page 2'),
    ),
    FavouritePage(
      key: PageStorageKey('Page 5'),
    ),
    BasketPage(
      key: PageStorageKey('Page 3'),
    ),
    SettingsPage(
      key: PageStorageKey('Page 4'),
    ),

  ];

  final List<Icon> icons = [
    Icon(Icons.store, size: 25, color: Colors.white),
    Icon(Icons.list, size: 25, color: Colors.white),
    Icon(Icons.favorite_border, size: 25, color: Colors.white),
    Icon(Icons.shopping_basket, size: 25, color: Colors.white),
    Icon(Icons.account_circle, size: 25, color: Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageStorage(
          child: pages[_selectedIndex],
          bucket: bucket,
        ),
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: AppTheme.mainColor,
            color: AppTheme.mainColor,
            height: 60.0,
            animationDuration: Duration(milliseconds: 400),
            animationCurve: Curves.easeInOutCirc,
            items: icons.map((value) => value).toList(),
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              }); //Handle button tap
            },
            index: _selectedIndex));
  }
}
