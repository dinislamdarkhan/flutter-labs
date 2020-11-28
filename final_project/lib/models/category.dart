import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  int id;
  String name;
  String image;
  bool isSelected;
  IconData icons;
  Category(
      {this.id, this.name, this.isSelected = false, this.image, this.icons});
}
