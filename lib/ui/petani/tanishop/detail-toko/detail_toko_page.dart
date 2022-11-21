import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/font_weight.dart';
import 'package:pusatani/const/text_style.dart';
import 'package:pusatani/reusable/custom_card.dart';
import 'package:pusatani/ui/petani/tanishop/detail-toko/detail_toko_controller.dart';
import 'package:pusatani/ui/petani/tanishop/detail_shop.dart/detail_pabrik_controller.dart';

import '../../../../const/app_constant.dart';

class DetailTokoPage extends StatelessWidget {
  const DetailTokoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailTokoController>(
        init: DetailTokoController(),
        builder: (c) => Scaffold(
              body: c.isLoading == false
                  ? CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          title: const Text('Detail Toko'),
                          pinned: true,
                          actions: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  onPressed: () {
                                    c.whatsapp();
                                  },
                                  icon: const Icon(Icons.message)),
                            )
                          ],
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 150,
                                      height: 150,
                                      child: Card(
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            c.detailTokoModel?.data?.image ??
                                                '',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.5,
                                          child: Text(
                                            c.detailTokoModel?.data?.name ??
                                                '-',
                                            maxLines: 2,
                                            style: blackTextStyle.copyWith(
                                                fontSize: 20,
                                                fontWeight: semiBold),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          c.detailTokoModel?.data?.address ??
                                              '-',
                                          style: blackTextStyle.copyWith(
                                              fontSize: 16, fontWeight: medium),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  c.detailTokoModel?.data?.deskripsi ?? '',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 16, fontWeight: medium),
                                ),
                                Container(
                                  width: double.infinity,
                                  color: primaryColor,
                                  margin: const EdgeInsets.all(8),
                                  child: Center(
                                    child: Text(
                                      'Harga Beli Gabah',
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 20, fontWeight: semiBold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return Container(
                                  margin:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    elevation: 3,
                                    child: Container(
                                      height: 300,
                                      width: Get.width * 0.4,
                                      decoration: const BoxDecoration(
                                          color: Colors.white),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              flex: 2,
                                              child: SizedBox(
                                                height: 100,
                                                width: double.infinity,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius
                                                              .vertical(
                                                          top: Radius.circular(
                                                              10)),
                                                  child: Image.network(
                                                    'http://pusatani.masuk.web.id/images/produk/${c.detailTokoModel?.data?.tokoToProduk?[index].image}',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    c
                                                            .detailTokoModel
                                                            ?.data
                                                            ?.tokoToProduk?[
                                                                index]
                                                            .name ??
                                                        '',
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                semiBold),
                                                  ),
                                                  Text(
                                                    c.formatter.format(c
                                                            .detailTokoModel
                                                            ?.data
                                                            ?.tokoToProduk?[
                                                                index]
                                                            .price
                                                            ?.toString() ??
                                                        ''),
                                                    style:
                                                        blackTextStyle.copyWith(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                semiBold),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ]),
                                    ),
                                  ));
                            },
                            childCount:
                                c.detailTokoModel!.data!.tokoToProduk!.length,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 0),
                        ),
                        SliverPadding(
                            padding: const EdgeInsets.symmetric(horizontal: 16))
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ));
  }
}
