import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/font_weight.dart';
import 'package:pusatani/const/text_style.dart';
import 'package:pusatani/data/model/list_article_model.dart';
import 'package:pusatani/reusable/article_card.dart';
import 'package:pusatani/reusable/toko_card.dart';
import 'package:pusatani/ui/auth/login/login_page.dart';
import 'package:pusatani/ui/detail_artikel/detail_artikel_page.dart';
import 'package:pusatani/ui/petani/home/petani_home_controller.dart';
import 'package:pusatani/ui/petani/infotani/info_tani_page.dart';
import 'package:pusatani/ui/petani/tanishop/detail-toko/detail_toko_page.dart';
import 'package:pusatani/ui/petani/tanishop/detail_shop.dart/detail_pabrik_page.dart';
import 'package:pusatani/ui/petani/tanishop/list/tani_shop_page.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../reusable/pabrik_card.dart';

class PetaniHomePage extends StatelessWidget {
  const PetaniHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PetaniHomeController>(
        init: PetaniHomeController(),
        builder: (c) {
          return Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: Colors.white,
              body: c.isLoading == false
                  ? RefreshIndicator(
                      onRefresh: () async {
                        c.getToko();
                        // c.getPabrik();
                      },
                      child: CustomScrollView(
                        slivers: <Widget>[
                          SliverAppBar(
                            actions: [
                              PopupMenuButton<int>(
                                  offset: const Offset(0, 0),
                                  itemBuilder: (context) => [
                                        PopupMenuItem<int>(
                                            value: 0,
                                            textStyle: blackTextStyle.copyWith(
                                                fontSize: 16),
                                            child: GestureDetector(
                                                onTap: () {
                                                  Get.offAll(
                                                      () => const LoginPage());
                                                },
                                                child: Container(
                                                  child: const Text(
                                                      'Daftar Sebagai Pemilik Toko/Pabrik'),
                                                )))
                                      ])
                            ],
                            backgroundColor: secondaryColor,
                            pinned: true,
                            centerTitle: false,
                            title: SvgPicture.asset(
                              'assets/images/appbar_logo.svg',
                              height: 30,
                              fit: BoxFit.contain,
                            ),
                            expandedHeight: 300,
                            flexibleSpace: FlexibleSpaceBar(
                              collapseMode: CollapseMode.pin,
                              background: Stack(
                                children: [
                                  CarouselSlider(
                                    items: [
                                      Image.asset(
                                        'assets/images/img_slider1.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                      Image.asset(
                                        'assets/images/img_slider2.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                      Image.asset(
                                        'assets/images/img_slider3.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                    options: CarouselOptions(
                                        viewportFraction: 1,
                                        autoPlay: true,
                                        padEnds: true,
                                        autoPlayInterval:
                                            const Duration(seconds: 4),
                                        height: double.infinity,
                                        autoPlayCurve: Curves.easeInOut,
                                        pauseAutoPlayOnTouch: true,
                                        onPageChanged: ((index, reason) {
                                          c.currentIndex = index;
                                          c.update();
                                        })),
                                    carouselController: c.carouselController,
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    right: 0,
                                    left: 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 24,
                                          height: 12,
                                          decoration: BoxDecoration(
                                              color: c.currentIndex == 0
                                                  ? primaryColor
                                                  : Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Container(
                                          width: 24,
                                          height: 12,
                                          decoration: BoxDecoration(
                                              color: c.currentIndex == 2
                                                  ? primaryColor
                                                  : Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                        Container(
                                          width: 24,
                                          height: 12,
                                          decoration: BoxDecoration(
                                              color: c.currentIndex == 1
                                                  ? primaryColor
                                                  : Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20))),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() => const InfoTaniPage());
                                        },
                                        child: Card(
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Container(
                                            width: 150,
                                            height: 170,
                                            padding: const EdgeInsets.all(5),
                                            decoration: const BoxDecoration(
                                                color: Color.fromRGBO(
                                                    252, 248, 248, 1),
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            20))),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Flexible(
                                                  flex: 6,
                                                  child: Image.asset(
                                                    'assets/images/img_tani_info.png',
                                                    width: double.infinity,
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text('Tani Info',
                                                      style: buttonTextStyle
                                                          .copyWith(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  semiBold)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() => const TaniShopPage());
                                        },
                                        child: Card(
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Container(
                                            width: 150,
                                            height: 170,
                                            padding: const EdgeInsets.all(5),
                                            decoration: const BoxDecoration(
                                                color: Color.fromRGBO(
                                                    252, 248, 248, 1),
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            20))),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Flexible(
                                                  flex: 6,
                                                  child: Image.asset(
                                                    'assets/images/img_tani_shop.png',
                                                    width: double.infinity,
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text('Tani Shop',
                                                      style: buttonTextStyle
                                                          .copyWith(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  semiBold)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Daftar Pabrik',
                                          style: GoogleFonts.catamaran(
                                              fontSize: 20,
                                              fontWeight: semiBold),
                                        ),
                                        GestureDetector(
                                          onTap: () => Get.to(
                                              () => const TaniShopPage()),
                                          child: Text(
                                            'Lihat Semua',
                                            style: GoogleFonts.catamaran(
                                                fontSize: 20,
                                                fontWeight: semiBold,
                                                color: primaryColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        children: c.pabrikModel!.data!.data!
                                            .map((item) => GestureDetector(
                                                  onTap: () => Get.to(
                                                      () =>
                                                          const DetailPabrikPage(),
                                                      arguments: item.id),
                                                  child: PabrikCard(
                                                    image: item.image!,
                                                    title: item.name!,
                                                  ),
                                                ))
                                            .toList()),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Daftar Toko',
                                          style: GoogleFonts.catamaran(
                                              fontSize: 20,
                                              fontWeight: semiBold),
                                        ),
                                        Text(
                                          'Lihat Semua',
                                          style: GoogleFonts.catamaran(
                                              fontSize: 20,
                                              fontWeight: semiBold,
                                              color: primaryColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        children: c.tokoModel!.data!.data!
                                            .map((item) => GestureDetector(
                                                onTap: () => Get.to(
                                                    () =>
                                                        const DetailTokoPage(),
                                                    arguments: item.id),
                                                child: TokoCard(
                                                  image: item.image ?? ' ',
                                                  title: item.name ?? ' ',
                                                )))
                                            .toList()),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Berita',
                                          style: GoogleFonts.catamaran(
                                              fontSize: 20,
                                              fontWeight: semiBold),
                                        ),
                                        GestureDetector(
                                          onTap: () => Get.to(
                                              () => const InfoTaniPage()),
                                          child: Text(
                                            'Lihat Semua',
                                            style: GoogleFonts.catamaran(
                                                fontSize: 20,
                                                fontWeight: semiBold,
                                                color: primaryColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            sliver: PagedSliverList(
                              pagingController: c.pagingController,
                              builderDelegate: PagedChildBuilderDelegate<Data2>(
                                itemBuilder: (context, item, index) {
                                  return GestureDetector(
                                    onTap: () => Get.to(
                                        () => DetailArtikelPage(),
                                        arguments: {
                                          'title': item.title,
                                          'image': item.image,
                                          'author': item.author,
                                          'content': item.body,
                                          'date': item.createdAt,
                                          'category': item.idCategory
                                        }),
                                    child: ArticleCard(
                                      image: item.image,
                                      date:
                                          DateTime.parse(item.createdAt ?? ''),
                                      description: item.body,
                                      title: item.title,
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ));
        });
  }
}
