import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/font_weight.dart';
import 'package:pusatani/const/text_style.dart';
import 'package:pusatani/reusable/custom_card.dart';
import 'package:pusatani/ui/petani/tanishop/detail_shop.dart/detail_shop_controller.dart';

import '../../../../const/app_constant.dart';

class DetailShopPage extends StatelessWidget {
  const DetailShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailShopController>(
        init: DetailShopController(),
        builder: (c) => Scaffold(
              appBar: AppBar(title: const Text('yo')),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/img_slider1.jpg'),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Toko Wanda',
                        maxLines: 5,
                        style: blackTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Alamat',
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: regular),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          lorem,
                          textAlign: TextAlign.justify,
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: medium),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Harga Beli Gabah',
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomCard(
                          toko: 'toko',
                          alamat: 'alamat',
                          image: 'assets/images/img_slider1.jpg'),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.abc_rounded,
                                  size: 24,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '+62b22222222',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
