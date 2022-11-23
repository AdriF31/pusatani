import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/font_weight.dart';
import 'package:pusatani/const/text_style.dart';
import 'package:pusatani/ui/detail_artikel/detail_artikel_controller.dart';
import 'package:pusatani/ui/petani/tanishop/detail-produk/detail_produk_controller.dart';

class DetailProdukPage extends StatelessWidget {
  const DetailProdukPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailProdukController>(
        init: DetailProdukController(),
        builder: (c) => Scaffold(
              appBar: AppBar(
                title: Text('Detail Produk'),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Image.network(
                      Get.arguments['role'] != 1
                          ? 'http://pusatani.masuk.web.id/images/produk/${Get.arguments['image']}'
                          : 'http://pusatani.masuk.web.id/images/gabah/${Get.arguments['image']}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Get.arguments['title'],
                            style: blackTextStyle.copyWith(
                                fontSize: 20, fontWeight: medium)),
                        Text(
                          c.formatter.format(Get.arguments['harga'].toString()),
                          style: blackTextStyle.copyWith(
                              fontSize: 24, fontWeight: bold),
                        ),
                        Divider(color: blackColor),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          Get.arguments['detail'],
                          style: blackTextStyle.copyWith(
                              fontSize: 18, fontWeight: regular),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
