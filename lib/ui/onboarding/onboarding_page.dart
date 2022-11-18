import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/text_style.dart';
import 'package:pusatani/ui/onboarding/onboarding_controller.dart';

import '../../const/app_constant.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
        init: OnboardingController(),
        builder: (c) => Scaffold(
              body: Stack(
                children: [
                  Positioned(
                      top: Get.height * 0.15,
                      child: Image.asset('assets/images/onboarding-1.png')),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/curve_bg.png'),
                      Container(
                        height: Get.height * 0.4,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(45))),
                        child: Column(
                          children: [
                            Text(
                              'dsdsaddsddsdsd',
                              style: whiteTextStyle.copyWith(fontSize: 24),
                            ),
                            Text(
                              'dsdsaddsddsdsd',
                              style: whiteTextStyle.copyWith(fontSize: 16),
                            ),
                            Expanded(
                              child: GridView(
                                  scrollDirection: Axis.horizontal,
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 200,
                                          
                                          childAspectRatio: 3 / 2,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20),
                                  children:
                                      //masukin widget
                                      pabrik
                                          .map((e) => Container(
                                                height: 100,
                                                width: 100,
                                                color: Colors.white,
                                                child: Text('hai'),
                                              ))
                                          .toList()),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ));
  }
}
