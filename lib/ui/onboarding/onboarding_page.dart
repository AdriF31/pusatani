import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/text_style.dart';
import 'package:pusatani/ui/auth/login/login_page.dart';
import 'package:pusatani/ui/onboarding/onboarding_controller.dart';
import 'package:pusatani/ui/petani/home/petani_home_page.dart';

import '../../const/app_constant.dart';
import '../../const/font_weight.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
        init: OnboardingController(),
        builder: (c) => Scaffold(
              body: Stack(
                children: [
                  SizedBox(
                    height: Get.height * 0.8,
                    child: CarouselSlider(
                      items: [
                        Image.asset(
                          'assets/images/onboarding-1.png',
                        ),
                        Image.asset(
                          'assets/images/onboarding-2.png',
                        ),
                      ],
                      options: CarouselOptions(
                          viewportFraction: 1,
                          padEnds: true,
                          height: double.infinity,
                          enableInfiniteScroll: false,
                          onPageChanged: ((index, reason) {
                            c.currentIndex = index;
                            c.update();
                          })),
                      carouselController: c.carouselController,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/curve_bg.png'),
                      Container(
                        height: Get.height * 0.45,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(45))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    c.onboarding[c.currentIndex]['title'],
                                    style:
                                        whiteTextStyle.copyWith(fontSize: 24),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.8,
                                    child: Text(
                                      c.onboarding[c.currentIndex]['desc'],
                                      style:
                                          whiteTextStyle.copyWith(fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                                visible: c.currentIndex == 1 ? true : false,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      'Masuk Sebagai',
                                      style:
                                          whiteTextStyle.copyWith(fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      height: 50,
                                      width: Get.width * 0.8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: secondaryColor,
                                      ),
                                      child: TextButton(
                                          onPressed: () {
                                            Get.offAll(() => PetaniHomePage());
                                          },
                                          child: Text(
                                            'Petani',
                                            style: buttonTextStyle.copyWith(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: bold),
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      height: 50,
                                      width: Get.width * 0.8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: secondaryColor,
                                      ),
                                      child: TextButton(
                                          onPressed: () {
                                            Get.offAll(() => LoginPage());
                                          },
                                          child: Text(
                                            'Toko atau Pabrik',
                                            style: buttonTextStyle.copyWith(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: bold),
                                          )),
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 24,
                                        height: 12,
                                        decoration: BoxDecoration(
                                            color: c.currentIndex == 0
                                                ? Colors.white
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
                                            color: c.currentIndex == 1
                                                ? Colors.white
                                                : Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ],
                                  ),
                                  c.currentIndex == 0
                                      ? TextButton(
                                          onPressed: () {
                                            c.carouselController.nextPage();
                                          },
                                          child: Text(
                                            'Selanjutnya',
                                            style: buttonTextStyle.copyWith(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: bold),
                                          ))
                                      : SizedBox(
                                          height: 50,
                                        )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }
}
