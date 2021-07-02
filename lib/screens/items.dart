import 'package:flutter/material.dart';
import 'package:samba/models/item_model.dart';

class Items extends StatefulWidget {
  const Items({Key? key, required this.itemList}) : super(key: key);

  final List itemList;

  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  List<ItemModel> _items = [];

  void getItems() {
    widget.itemList.forEach((e) {
      _items.add(ItemModel.fromYaml(
          caption: e['caption'],
          image: e['image'],
          subMenus: e['subMenus'],
          price: e['price']));
    });
  }

  @override
  void initState() {
    super.initState();
    getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
      ),
      body: ListView(
        children: _items.map((e) => e.getItemCard()).toList(),
      ),
    );
  }
}
