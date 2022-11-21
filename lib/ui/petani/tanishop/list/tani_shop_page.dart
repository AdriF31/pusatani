import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusatani/reusable/custom_store_card.dart';
import 'package:pusatani/ui/petani/tanishop/detail_shop.dart/detail_pabrik_page.dart';
import 'package:pusatani/ui/petani/tanishop/list/tani_shop_controller.dart';

import '../../../../const/colors.dart';
import '../detail-toko/detail_toko_page.dart';

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
        builder: (c) {
          return Scaffold(
            appBar: AppBar(title: const Text('Tani Shop')),
            body: c.isLoading == false
                ? Column(
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
                            Column(
                              children: c.tokoModel!.data!.data!
                                  .map((e) => GestureDetector(
                                        onTap: () => Get.to(
                                            () => const DetailTokoPage(),
                                            arguments: e.id),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 4),
                                          child: CustomStoreCard(
                                            address: e.address,
                                            image: e.image,
                                            name: e.name,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                            Column(
                              children: c.pabrikModel!.data!.data!
                                  .map((e) => GestureDetector(
                                        onTap: () => Get.to(
                                            () => const DetailPabrikPage(),
                                            arguments: e.id),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 4),
                                          child: CustomStoreCard(
                                            address: e.address,
                                            image: e.image,
                                            name: e.name,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        });
  }

  // Widget pabrik() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //     child: Column(
  //       children: [
  //         GestureDetector(
  //             onTap: () => Get.to(() => const DetailArtikelPage()),
  //             child: CustomStoreCard())
  //       ],
  //     ),
  //   );
  // }
}
