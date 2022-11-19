import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/text_style.dart';
import 'package:pusatani/ui/toko-pabrik/home/home_controller.dart';

import '../../../const/font_weight.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required this.role});
  int role;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (c) => Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Hai om,\n Selamat datang di PusaTanI',
                                style: blackTextStyle.copyWith(
                                    fontSize: 20, fontWeight: semiBold),
                              ),
                            ),
                            const Expanded(
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/img_slider1.jpg'),
                                radius: 50,
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
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  role == 3
                                      ? 'Toko Anda mana'
                                      : 'Pabrik anda mana',
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
                                  borderRadius: BorderRadius.circular(10)),
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
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Status Akun',
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 20, color: Colors.white),
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
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Jumlah Produk',
                                        style: whiteTextStyle.copyWith(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      Text(
                                        '10',
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
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
