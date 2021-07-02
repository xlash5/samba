import 'package:flutter/material.dart';
import 'package:samba/screens/sub_menus.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer({
    Key? key,
    required this.imagePath,
    required this.caption,
    this.price,
    final this.subMenus,
    this.isSubMenuItem = false,
  }) : super(key: key);

  final String caption;
  final String imagePath;
  final String? price;
  final List? subMenus;
  final bool isSubMenuItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: GestureDetector(
          onTap: () {
            if (subMenus != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SubMenus(subMenus: subMenus ?? ['EMPTY'])),
              );
            }
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          caption,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          isSubMenuItem
                              ? (price == ' ' ? '' : '+ $price TRY')
                              : 'Fiyat: $price TRY',
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.end,
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
