import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:flutter_application_1/models/menu.dart';
import 'package:flutter_application_1/widgets/size_card.dart';

import '../widgets/menu_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference products = firestore.collection('products');
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello Hamka',
                  style: poppinsTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                  ),
                ),
                Text(
                  'Selamat Datang di Burger Murder',
                  style: poppinsTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: greyColor,
                  ),
                ),
                const SizedBox(height: 22),
                Text(
                  'Recomended Menu',
                  style: poppinsTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: blackColor,
                  ),
                ),
                const SizedBox(height: 22),
                StreamBuilder<QuerySnapshot>(
                    stream:
                        products.orderBy('id', descending: false).snapshots(),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: (snapshot.data! as QuerySnapshot)
                              .docs
                              .map(
                                (e) => MenuCard(
                                  Menu(
                                    id: e['id'],
                                    image: e['image'],
                                    name: e['name'],
                                    price: e['price'],
                                    pricePromo: e['pricePromo'],
                                    note: e['note'],
                                    isPromo: e['isPromo'],
                                  ),
                                ),
                              )
                              .toList(),
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
