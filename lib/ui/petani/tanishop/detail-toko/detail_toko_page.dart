import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/font_weight.dart';
import 'package:pusatani/const/text_style.dart';
import 'package:pusatani/reusable/back_button.dart';
import 'package:pusatani/ui/petani/tanishop/detail-produk/detail_produk._page.dart';
import 'package:pusatani/ui/petani/tanishop/detail-toko/detail_toko_controller.dart';

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
                          leading: CustomBackButton(),
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
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 150,
                                            height: 150,
                                            child: Card(
                                              elevation: 3,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: SizedBox(
                                                  child: Image.network(
                                                    c.detailTokoModel?.data
                                                            ?.data?.image ??
                                                        '',
                                                    fit: BoxFit.cover,
                                                  ),
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
                                                width: Get.width * 0.48,
                                                child: Text(
                                                  c.detailTokoModel?.data?.data
                                                          ?.name ??
                                                      '-',
                                                  maxLines: 2,
                                                  style:
                                                      whiteTextStyle.copyWith(
                                                          fontSize: 20,
                                                          fontWeight: semiBold),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                c.detailTokoModel?.data?.data
                                                        ?.address ??
                                                    '-',
                                                style: whiteTextStyle.copyWith(
                                                    fontSize: 16,
                                                    fontWeight: medium),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        width: Get.width,
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(
                                          c.detailTokoModel?.data?.data
                                                  ?.deskripsi ??
                                              '',
                                          style: blackTextStyle.copyWith(
                                              fontSize: 16, fontWeight: medium),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: primaryColor,
                                  ),
                                  margin: const EdgeInsets.all(8),
                                  child: Center(
                                    child: Text(
                                      'Produk',
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 20, fontWeight: semiBold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          sliver: SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return GestureDetector(
                                  onTap: () => Get.to(() => DetailProdukPage(),
                                      arguments: {
                                        'title': c.detailTokoModel?.data?.data
                                            ?.tokoToProduk?[index]['name'],
                                        'harga': c.detailTokoModel?.data?.data
                                            ?.tokoToProduk?[index]['price'],
                                        'image': c.detailTokoModel?.data?.data
                                            ?.tokoToProduk?[index]['image'],
                                        'detail': c.detailTokoModel?.data?.data
                                            ?.tokoToProduk?[index]['detail']
                                      }),
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
                                              flex: 5,
                                              child: SizedBox(
                                                height: 200,
                                                width: double.infinity,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius
                                                              .vertical(
                                                          top: Radius.circular(
                                                              10)),
                                                  child: Image.network(
                                                    'http://pusatani.masuk.web.id/images/produk/${c.detailTokoModel?.data?.data?.tokoToProduk?[index]['image']}',
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
                                                                ?.data
                                                                ?.tokoToProduk?[
                                                            index]['name'] ??
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
                                                            ?.data
                                                            ?.tokoToProduk?[
                                                                index]['price']
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
                                  ),
                                );
                              },
                              childCount: c.detailTokoModel!.data!.data!
                                  .tokoToProduk!.length,
                            ),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1,
                                    mainAxisSpacing: 5,
                                    mainAxisExtent: 250,
                                    crossAxisSpacing: 5),
                          ),
                        ),
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ));
  }
}
