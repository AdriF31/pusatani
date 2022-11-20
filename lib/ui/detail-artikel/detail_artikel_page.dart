import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusatani/const/app_constant.dart';
import 'package:pusatani/const/font_weight.dart';
import 'package:pusatani/ui/detail-artikel/detail_artikel_controller.dart';
import 'package:basic_utils/basic_utils.dart';
import '../../const/text_style.dart';

class DetailArtikelPage extends StatelessWidget {
  const DetailArtikelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailArtikelController>(
        init: DetailArtikelController(),
        builder: (c) => Scaffold(
              floatingActionButton: FloatingActionButton(onPressed: () {
                if (c.fontSize >= 16 && c.fontSize < 32) {
                  c.fontSize++;
                  c.update();
                }
              }),
              appBar: AppBar(title: Text(Get.arguments['title'])),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        Get.arguments['title'],
                        maxLines: 5,
                        style: blackTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Get.arguments['author'],
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: regular),
                          ),
                          Text(
                            Get.arguments['date'].toString().split('T').first,
                            style: blackTextStyle.copyWith(
                                fontSize: 16, fontWeight: regular),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            Get.arguments['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          Get.arguments['content'],
                          textAlign: TextAlign.justify,
                          style: blackTextStyle.copyWith(
                              fontSize: c.fontSize, fontWeight: medium),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
