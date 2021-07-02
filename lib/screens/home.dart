import 'package:flutter/material.dart';
import 'package:samba/data/get_data.dart';
import 'package:samba/models/menu_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  List<MenuModel> _menuList = [];
  bool _isLoading = true;

  void getYaml() async {
    final mapData = await getData();
    // mapData['menus'][0]['items'].forEach((m) {
    //   print(m['caption']);
    // });
    // mapData['menus'].forEach((m) {
    //   print(m['key']);
    // });

    mapData['menus'][0]['items'].forEach((m) {
      _menuList.add(MenuModel.fromYaml(
          caption: m['caption'], image: m['image'], items: m['items']));
    });

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getYaml();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: _menuList.map((e) => e.getMenuCard()).toList(),
            ),
    );
  }
}
