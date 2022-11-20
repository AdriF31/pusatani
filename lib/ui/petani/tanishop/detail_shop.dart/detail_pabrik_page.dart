import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/font_weight.dart';
import 'package:pusatani/const/text_style.dart';
import 'package:pusatani/reusable/custom_card.dart';
import 'package:pusatani/ui/petani/tanishop/detail_shop.dart/detail_pabrik_controller.dart';

import '../../../../const/app_constant.dart';

class DetailPabrikPage extends StatelessWidget {
  const DetailPabrikPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPabrikController>(
        init: DetailPabrikController(),
        builder: (c) => Scaffold(
              appBar: AppBar(title: const Text('yo')),
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
                                        c.detailPabrikModel.data?.image ?? '',
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
                                      c.detailPabrikModel.data?.name ?? '-',
                                      maxLines: 5,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 24, fontWeight: semiBold),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      c.detailPabrikModel.data?.address ?? '-',
                                      style: blackTextStyle.copyWith(
                                          fontSize: 16, fontWeight: regular),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Harga Beli Gabah',
                              style: blackTextStyle.copyWith(
                                  fontSize: 16, fontWeight: semiBold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Column(
                                children:
                                    c.detailPabrikModel.data!.pabrikToGabah!
                                        .asMap()
                                        .map((index, element) => MapEntry(
                                            index,
                                            CustomProductCard(
                                              toko: element.name,
                                              alamat: element.detail,
                                              image: element.image,
                                              stok: 'tersedia',
                                            )))
                                        .values
                                        .toList()),
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
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ));
  }
}
