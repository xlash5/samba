import 'package:flutter/material.dart';
import 'package:samba/data/get_data.dart';
import 'package:samba/models/sub_menu_model.dart';

class SubMenus extends StatefulWidget {
  const SubMenus({Key? key, required this.subMenus}) : super(key: key);

  final List subMenus;

  @override
  _SubMenusState createState() => _SubMenusState();
}

class _SubMenusState extends State<SubMenus> {
  List<SubMenuModel> _menuList = [];
  bool _isLoading = true;

  void getList() async {
    final mapData = await getData();

    mapData['menus'].forEach((m) {
      if (widget.subMenus.contains(m['key'])) {
        _menuList.add(SubMenuModel.fromYaml(
            description: m['description'], items: m['items']));
      }
    });

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SubMenus'),
      ),
      body: ListView(
        children: _menuList.map((e) => e.getItemCard()).toList(),
      ),
    );
  }
}
