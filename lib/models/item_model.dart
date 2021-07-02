import 'package:samba/widgets/item_container.dart';
import 'package:flutter/material.dart';

class ItemModel {
  ItemModel(
      {required this.caption,
      required this.image,
      this.subMenus,
      required this.price});
  final String caption;
  final String image;
  final List? subMenus;
  final String price;

  static ItemModel fromYaml(
      {required String caption,
      required String image,
      List? subMenus,
      required dynamic price}) {
    ItemModel menu = ItemModel(
        caption: caption,
        image: image,
        subMenus: subMenus ?? null,
        price: price.toString());
    return menu;
  }

  Widget getItemCard() {
    return ItemContainer(
      caption: caption,
      imagePath: image,
      price: price,
      subMenus: subMenus,
    );
  }
}
