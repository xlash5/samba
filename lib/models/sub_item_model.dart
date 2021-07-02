import 'package:samba/widgets/item_container.dart';
import 'package:flutter/material.dart';

class SubItemModel {
  SubItemModel({required this.name, required this.image, this.price});
  final String name;
  final String image;
  final String? price;

  static SubItemModel fromYaml(
      {required String name, required String image, dynamic price}) {
    SubItemModel menu =
        SubItemModel(name: name, image: image, price: price.toString());
    return menu;
  }

  Widget getItemCard() {
    return Text(price.toString());
  }
}
