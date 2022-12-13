import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/menu.dart';
import 'package:flutter_application_1/screens/detail_screen.dart';
import 'package:flutter_application_1/theme.dart';

class MenuCard extends StatelessWidget {
  final Menu menu;
  const MenuCard(this.menu, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailScreen()));
      },
      child: Row(
        children: [
          Image.network(
            menu.image,
            width: 130,
            height: 110,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              menu.isPromo
                  ? Image.network(
                      'assets/promo.png',
                      width: 47,
                      height: 16,
                    )
                  : Image.asset(
                      'assets/terlaris.png',
                      width: 47,
                      height: 16,
                    ),
              const SizedBox(height: 4),
              Text(
                menu.name,
                style: poppinsTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    'Rp ${menu.price}',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: greyColor,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Rp ${menu.price}',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: yellowColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Free Delivery',
                style: poppinsTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: greyColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
