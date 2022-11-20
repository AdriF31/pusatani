import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/text_style.dart';
import 'package:pusatani/reusable/custom_card.dart';
import 'package:pusatani/ui/toko-pabrik/home/home_controller.dart';

import '../../../const/font_weight.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (c) => Scaffold(
              body: c.isLoading == false
                  ? SafeArea(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Hai ${c.storage.getCurrentUsername()},\nSelamat datang di PusaTanI',
                                      style: blackTextStyle.copyWith(
                                          fontSize: 18, fontWeight: semiBold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          color: blackColor,
                                          shape: BoxShape.circle),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'http://pusatani.masuk.web.id/images/profile/${c.storage.getCurrentProfilePicture() ?? ''}'),
                                        radius: 50,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              height: 150,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        c.storage.getCurrentRole() == 3
                                            ? c.detailTokoModel?.data?.name ??
                                                ''
                                            : c.detailPabrikModel.data?.name ??
                                                '',
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 24, color: Colors.white),
                                      ),
                                      Text(
                                        'Jl. I Aja dulu',
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: Get.width * 0.3,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/images/img_slider1.jpg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 150,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              'Status Akun',
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              'Verified',
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 28,
                                                  color: Colors.white,
                                                  fontWeight: bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 150,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              'Jumlah Produk',
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              c.storage.getCurrentRole() == 3
                                                  ? c.detailTokoModel!.data!
                                                      .tokoToProduk!.length
                                                      .toString()
                                                  : c.detailPabrikModel.data!
                                                      .pabrikToGabah!.length
                                                      .toString(),
                                              style: whiteTextStyle.copyWith(
                                                  fontSize: 32,
                                                  color: Colors.white,
                                                  fontWeight: bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                c.storage.getCurrentRole() == 3
                                    ? 'Produk'
                                    : 'Gabah',
                                style: blackTextStyle.copyWith(
                                    fontSize: 24, fontWeight: semiBold),
                              ),
                            ),
                            Column(
                                children: c.storage.getCurrentRole() == 3
                                    ? c.detailTokoModel!.data!.tokoToProduk!
                                        .asMap()
                                        .map((index, element) => MapEntry(
                                            index,
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              child: GestureDetector(
                                                onLongPress: () {
                                                  c.deleteData(element.id!);
                                                  c.update();
                                                  c.getData();
                                                },
                                                child: CustomProductCard(
                                                  toko: element.name,
                                                  alamat: element.detail,
                                                  image:
                                                      'http://pusatani.masuk.web.id/images/produk/${element.image}',
                                                  stok: element.stok,
                                                ),
                                              ),
                                            )))
                                        .values
                                        .toList()
                                    : c.detailPabrikModel.data!.pabrikToGabah!
                                        .asMap()
                                        .map((index, element) => MapEntry(
                                            index,
                                            Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: GestureDetector(
                                                child: CustomProductCard(
                                                  toko: element.name,
                                                  alamat: element.detail,
                                                  image:
                                                      'http://pusatani.masuk.web.id/images/gabah/${element.image}',
                                                  stok: 'tersedia',
                                                ),
                                              ),
                                            )))
                                        .values
                                        .toList()),
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ));
  }
}
