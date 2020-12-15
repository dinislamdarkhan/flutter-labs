import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:qolbuyim/pages/product_list_page.dart';
import 'package:qolbuyim/utils/app_theme.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = '/category';

  const CategoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: AppTheme.horizontalSpace,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 35,
            ),
            title(),
            Settings(),
          ],
        ),
      ),
    ));
  }
}

Widget title() {
  return Container(
    margin: AppTheme.defaultSpace,
    child: Text('Category', style: AppTheme.titleStyle),
  );
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SettingsItem(Icons.apps, hex('#AF8AF8'), 'All'),
        SettingsItem(Icons.event_seat, hex('#AF8AF8'), 'Home'),
        SettingsItem(Icons.beach_access, hex('#AF8AF8'), 'Accessories'),
        SettingsItem(
            Icons.supervisor_account, hex('#AF8AF8'), 'Shoes & Clothes'),
        SettingsItem(Icons.toys, hex('#AF8AF8'), 'Toys'),
        SettingsItem(Icons.flare, hex('#AF8AF8'), 'Jewelry'),
        SettingsItem(Icons.fastfood, hex('#AF8AF8'), 'Kitchen'),
      ],
    );
  }
}

class SettingsItem extends StatefulWidget {
  SettingsItem(this.icon, this.iconBgColor, this.title);

  final IconData icon;
  final Color iconBgColor;
  final String title;

  @override
  _SettingsItemState createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Parent(
      style: settingsItemStyle(pressed),
      gesture: Gestures()
        ..isTap((isTapped) {
          Navigator.pushNamed(context, ProductListPage.routeName);
          setState(() => pressed = isTapped);
        }),
      child: Row(
        children: <Widget>[
          Parent(
            style: settingsItemIconStyle(widget.iconBgColor),
            child: Icon(widget.icon, color: Colors.white, size: 20),
          ),
          SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Txt(widget.title, style: itemTitleTextStyle),
            ],
          )
        ],
      ),
    );
  }

  final settingsItemStyle = (pressed) => ParentStyle()
    ..elevation(pressed ? 0 : 50, color: Colors.grey)
    ..scale(pressed ? 0.95 : 1.0)
    ..alignmentContent.center()
    ..height(70)
    ..margin(vertical: 10)
    ..borderRadius(all: 15)
    ..background.hex('#ffffff')
    ..ripple(true)
    ..animate(150, Curves.easeOut);

  final settingsItemIconStyle = (Color color) => ParentStyle()
    ..background.color(color)
    ..margin(left: 15)
    ..padding(all: 12)
    ..borderRadius(all: 30);

  final TxtStyle itemTitleTextStyle = TxtStyle()
    ..bold()
    ..fontSize(16);

  final TxtStyle itemDescriptionTextStyle = TxtStyle()
    ..textColor(Colors.black26)
    ..bold()
    ..fontSize(12);
}
