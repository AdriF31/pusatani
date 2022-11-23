import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusatani/const/app_constant.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/const/font_weight.dart';
import 'package:pusatani/reusable/back_button.dart';
import 'package:pusatani/ui/detail_artikel/detail_artikel_controller.dart';
import 'package:basic_utils/basic_utils.dart';
import '../../const/text_style.dart';

class DetailArtikelPage extends StatelessWidget {
  const DetailArtikelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailArtikelController>(
        init: DetailArtikelController(),
        builder: (c) => Scaffold(
              // floatingActionButton: FloatingActionButton(onPressed: () {
              //   if (c.fontSize >= 16 && c.fontSize < 32) {
              //     c.fontSize++;
              //     c.update();
              //   }
              // }),
              appBar: AppBar(
                title: Text(Get.arguments['author'],
                    maxLines: 1, overflow: TextOverflow.visible),
                leading: CustomBackButton(),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: 250,
                              width: double.infinity,
                              child: Image.network(
                                Get.arguments['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          Get.arguments['title'],
                          maxLines: 3,
                          style: blackTextStyle.copyWith(
                              fontSize: 20, fontWeight: semiBold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              Get.arguments['date'].toString().split('T').first,
                              style: whiteTextStyle.copyWith(
                                  fontSize: 16, fontWeight: regular),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            Get.arguments['content'],
                            textAlign: TextAlign.justify,
                            style: whiteTextStyle.copyWith(
                                fontSize: c.fontSize, fontWeight: medium),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
