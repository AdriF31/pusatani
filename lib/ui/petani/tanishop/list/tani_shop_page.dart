import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusatani/const/text_style.dart';
import 'package:pusatani/reusable/custom_card.dart';
import 'package:pusatani/ui/detail/detail_page.dart';
import 'package:pusatani/ui/petani/tanishop/detail_shop.dart/detail_shop_page.dart';
import 'package:pusatani/ui/petani/tanishop/list/tani_shop_controller.dart';

import '../../../../const/colors.dart';
import '../../../../const/font_weight.dart';

class TaniShopPage extends StatefulWidget {
  const TaniShopPage({Key? key}) : super(key: key);

  @override
  State<TaniShopPage> createState() => _InfoTaniPageState();
}

class _InfoTaniPageState extends State<TaniShopPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaniShopController>(
        init: TaniShopController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(title: const Text('Tani Shop')),
            body: Column(
              children: [
                SafeArea(
                    child: Container(
                  height: 10,
                )),
                ButtonsTabBar(
                  controller: tabController,
                  backgroundColor: primaryColor,
                  height: 60,
                  unselectedBackgroundColor: Colors.transparent,
                  labelStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  borderWidth: 1,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: Get.width * 0.18),
                  unselectedBorderColor: blackColor,
                  tabs: const [
                    Tab(
                      text: 'Toko',
                    ),
                    Tab(
                      text: "Pabrik",
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: <Widget>[
                      toko(),
                      pabrik(),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget toko() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Get.to(() => const DetailShopPage()),
            child: SizedBox(
              height: 120,
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 150,
                      height: double.infinity,
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/img_slider1.jpg',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Toko Al Wanda',
                            style: blackTextStyle.copyWith(
                                fontSize: 18, fontWeight: semiBold),
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                          ),
                          Text(
                            'Jl. i aja dulu',
                            style: greyTextStyle.copyWith(
                                fontSize: 14, fontWeight: semiBold),
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget pabrik() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          GestureDetector(
              onTap: () => Get.to(() => const DetailPage()),
              child: CustomCard(
                image: 'assets/images/img_slider1.jpg',
                toko: 'Wanda',
                alamat: 'Jl apa ya',
              ))
        ],
      ),
    );
  }
}
