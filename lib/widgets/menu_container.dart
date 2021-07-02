import 'package:flutter/material.dart';
import 'package:samba/screens/items.dart';

class MenuContainer extends StatelessWidget {
  const MenuContainer(
      {Key? key,
      required this.imagePath,
      required this.caption,
      required this.items})
      : super(key: key);

  final String caption;
  final String imagePath;
  final List items;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Items(itemList: items)),
            );
          },
          child: Container(
            child: Column(
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        caption,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x10000000),
                      spreadRadius: 5,
                      blurRadius: 8,
                      offset: Offset(0, 0))
                ]),
          ),
        ));
  }
}
