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
              appBar: AppBar(
                title: const Text('Detail Toko'),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {
                          c.whatsapp();
                        },
                        icon: Icon(Icons.message)),
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: c.isLoading == false
                    ? SingleChildScrollView(
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
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        c.detailTokoModel!.data?.image ?? '',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      c.detailTokoModel!.data!.name ?? '-',
                                      maxLines: 5,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 24, fontWeight: semiBold),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      c.detailTokoModel!.data?.address ?? '-',
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
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Produk',
                              style: blackTextStyle.copyWith(
                                  fontSize: 24, fontWeight: semiBold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Column(
                                children: c.detailTokoModel!.data!.tokoToProduk!
                                    .asMap()
                                    .map((index, element) => MapEntry(
                                        index,
                                        CustomProductCard(
                                          stok: element.stok,
                                          toko: element.name ?? '-',
                                          alamat: c.formatter
                                              .format(element.price.toString()),
                                          image:
                                              'http://pusatani.masuk.web.id/images/produk/${element.image}',
                                        )))
                                    .values
                                    .toList()),
                          ],
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ));
  }
}
