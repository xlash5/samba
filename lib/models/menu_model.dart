import 'package:samba/widgets/menu_container.dart';
import 'package:flutter/material.dart';

class MenuModel {
  MenuModel({required this.caption, required this.image, required this.items});
  final String caption;
  final String image;
  final List items;

  static MenuModel fromYaml(
      {required String caption, required String image, required List items}) {
    MenuModel menu = MenuModel(
      caption: caption,
      image: image,
      items: items,
    );
    return menu;
  }

  Widget getMenuCard() {
    return MenuContainer(
      caption: caption,
      imagePath: image,
      items: items,
    );
  }
}
