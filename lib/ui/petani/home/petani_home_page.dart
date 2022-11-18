import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/font_weight.dart';
import 'package:pusatani/const/text_style.dart';
import 'package:pusatani/ui/petani/home/petani_home_controller.dart';
import 'package:pusatani/ui/petani/infotani/info_tani_page.dart';
import 'package:pusatani/ui/petani/tanishop/list/tani_shop_page.dart';
import 'package:shimmer/shimmer.dart';

class PetaniHomePage extends StatelessWidget {
  const PetaniHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PetaniHomeController>(
        init: PetaniHomeController(),
        builder: (c) {
          return Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: Colors.white.withOpacity(0.7),
              body: c.isLoading == false
                  ? RefreshIndicator(
                      onRefresh: () async {
                        c.getToko();
                        // c.getPabrik();
                      },
                      child: CustomScrollView(
                        slivers: <Widget>[
                          // SliverLayoutBuilder(
                          //   builder: (BuildContext context, constraints) {
                          //     final scrolled = constraints.scrollOffset > 0;
                          //     return
                          //   },
                          // ),
                          SliverAppBar(
                            backgroundColor: Colors.white,
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
                                          c.currentIndex.value = index;
                                        })),
                                    carouselController: c.carouselController,
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
                                        children: c.pabrikModel!.data!
                                            .map((e) => Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 8),
                                                  child: Card(
                                                    elevation: 3,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                    child: SizedBox(
                                                      width: 140,
                                                      height: 180,
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                        .vertical(
                                                                    top: Radius
                                                                        .circular(
                                                                            10)),
                                                            child: Image.network(
                                                                e.image ?? '',
                                                                height: 140,
                                                                fit: BoxFit
                                                                    .fitHeight,
                                                                loadingBuilder:
                                                                    (context,
                                                                        child,
                                                                        loadingProgress) {
                                                                  if (loadingProgress ==
                                                                      null) {
                                                                    return child;
                                                                  }
                                                                  return Shimmer
                                                                      .fromColors(
                                                                    baseColor:
                                                                        Colors
                                                                            .grey,
                                                                    highlightColor:
                                                                        Colors
                                                                            .grey
                                                                            .shade400,
                                                                    direction:
                                                                        ShimmerDirection
                                                                            .ltr,
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          140,
                                                                      color: Colors
                                                                          .grey,
                                                                    ),
                                                                  );
                                                                },
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          140,
                                                                      color: Colors
                                                                          .grey,
                                                                    )),
                                                          ),
                                                          Text(
                                                            e.name ?? '',
                                                            style: GoogleFonts
                                                                .catamaran(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        semiBold),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
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
                                        children: c.tokoModel!.data!
                                            .map((e) => Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 8),
                                                  child: Card(
                                                    elevation: 3,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                    child: SizedBox(
                                                      width: 140,
                                                      height: 180,
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                        .vertical(
                                                                    top: Radius
                                                                        .circular(
                                                                            10)),
                                                            child: Image.network(
                                                                e.image ?? '',
                                                                height: 140,
                                                                fit: BoxFit
                                                                    .fitHeight,
                                                                loadingBuilder:
                                                                    (context,
                                                                        child,
                                                                        loadingProgress) {
                                                                  if (loadingProgress ==
                                                                      null) {
                                                                    return child;
                                                                  }
                                                                  return Shimmer
                                                                      .fromColors(
                                                                    baseColor:
                                                                        Colors
                                                                            .grey,
                                                                    highlightColor:
                                                                        Colors
                                                                            .grey
                                                                            .shade400,
                                                                    direction:
                                                                        ShimmerDirection
                                                                            .ltr,
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          140,
                                                                      color: Colors
                                                                          .grey,
                                                                    ),
                                                                  );
                                                                },
                                                                errorBuilder: (context,
                                                                        error,
                                                                        stackTrace) =>
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          140,
                                                                      color: Colors
                                                                          .grey,
                                                                    )),
                                                          ),
                                                          Text(
                                                            e.name ?? '',
                                                            style: GoogleFonts
                                                                .catamaran(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        semiBold),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
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
                                          'Berita',
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
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Column(
                                      children: [
                                        Card(
                                          elevation: 3,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Column(
                                            children: [
                                              Card(
                                                elevation: 3,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.asset(
                                                      'assets/images/img_slider1.jpg'),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 300,
                                                      child: Text(
                                                        '31 Februari 2022',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts
                                                            .catamaran(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    regular,
                                                                color: Colors
                                                                    .black54),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 300,
                                                      child: Text(
                                                        'Aku suka membajak membajak membajak. ini konten beritana nya bingung diisi naon',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts
                                                            .catamaran(
                                                          fontSize: 20,
                                                          fontWeight: semiBold,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: Text(
                                                        'Aku suka membajak membajak membajak. ini konten beritana nya bingung diisi naon',
                                                        maxLines: 3,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts
                                                            .catamaran(
                                                          fontSize: 16,
                                                          fontWeight: regular,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                                  // TextButton(
                                  //   onPressed: () async {
                                  //     whatsapp();
                                  //   },
                                  //   child: Text('wa'),
                                  // )
                                  const SizedBox(
                                    height: 12,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      color: Colors.white,
                      child: const Center(child: CircularProgressIndicator())));
        });
  }

  // whatsapp() async {
  //   var contact = "+6282319858335";
  //   var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
  //   var iosUrl =
  //       "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

  //   try {
  //     if (Platform.isIOS) {
  //       await launchUrl(Uri.parse(iosUrl));
  //     } else {
  //       await launchUrl(Uri.parse(androidUrl));
  //     }
  //   } on Exception catch (e) {
  //     Fluttertoast.showToast(msg: 'WhatsApp is not installed.');
  //   }
  // }
}
