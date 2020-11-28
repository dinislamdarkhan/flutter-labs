import 'package:qolbuyim/models/promo.dart';

import 'category.dart';
import 'product.dart';

class AppData {
  static List<Promo> promoList = [
    Promo(
        promoText: 'Music Box',
        price: 15000,
        salePrice: 7500,
        promoIcon: 'Bose speaker.png'),
    Promo(
        promoText: 'Music Box',
        price: 15000,
        salePrice: 7500,
        promoIcon: 'Bose speaker.png'),
    Promo(
        promoText: 'Music Box',
        price: 15000,
        salePrice: 7500,
        promoIcon: 'Bose speaker.png'),
    Promo(
        promoText: 'Music Box',
        price: 15000,
        salePrice: 7500,
        promoIcon: 'Bose speaker.png'),
  ];
  static List<Product> productList = [
    Product(
        id: 1,
        name: 'Origami Panda',
        price: 500,
        isSelected: true,
        isliked: false,
        image: 'assets/origami.png',
        category: "1"),
    Product(
        id: 2,
        name: 'Organizer Pro',
        price: 220,
        isliked: false,
        image: 'assets/laptop.png',
        category: "1"),
    Product(
        id: 2,
        name: 'SW Teether',
        price: 1000,
        isliked: false,
        image: 'assets/Original.png',
        category: "1"),
    Product(
        id: 2,
        name: 'iPhone Card Holder',
        price: 1500,
        isliked: false,
        image: 'assets/Lg.png',
        category: "1"),
    Product(
        id: 2,
        name: 'Backgammon Classic',
        price: 220,
        isliked: false,
        image: 'assets/Pixelbook.png',
        category: "1"),
  ];
  static List<Product> cartList = [
  ];
  static List<Product> favouriteList = [
  ];
  static List<Category> categoryList = [
    Category(),
    Category(
      id: 1,
      name: "Accessories",
      image: '',
    ),
    Category(id: 2, name: "Home", image: ''),
    Category(id: 3, name: "Toys", image: '', isSelected: true),
    Category(id: 4, name: "Jewelry", image: ''),
  ];
  static List<String> showThumbnailList = [];
  static String description =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
}
