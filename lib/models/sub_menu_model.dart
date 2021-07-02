import 'package:samba/widgets/item_container.dart';
import 'package:flutter/material.dart';
import './sub_item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SubMenuModel {
  SubMenuModel({required this.description, required this.items});
  final String description;
  final List<SubItemModel> items;

  static SubMenuModel fromYaml(
      {required String description, required List items}) {
    SubMenuModel menu = SubMenuModel(
      description: description,
      items: items
          .map((e) => SubItemModel.fromYaml(
              name: e['name'] ?? ' ',
              image: e['image'] ?? ' ',
              price: e['price'] ?? ' '))
          .toList(),
    );
    return menu;
  }

  Widget getItemCard() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(height: 320.0, enableInfiniteScroll: false),
          items: items.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Column(
                  children: [
                    Container(
                      height: 320.0,
                      child: ItemContainer(
                        imagePath: i.image,
                        caption: i.name,
                        price: i.price.toString(),
                        isSubMenuItem: true,
                      ),
                    ),
                  ],
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
