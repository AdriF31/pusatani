import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusatani/const/app_constant.dart';
import 'package:pusatani/const/font_weight.dart';
import 'package:pusatani/ui/detail/detail_controller.dart';

import '../../const/text_style.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
        init: DetailController(),
        builder: (c) => Scaffold(
              floatingActionButton: FloatingActionButton(onPressed: () {
                if (c.fontSize >= 16 && c.fontSize < 32) {
                  c.fontSize++;
                  c.update();
                }
              }),
              appBar: AppBar(title: const Text('Detail')),
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
                        'Ini Judul Berita hehedsdsdsd',
                        maxLines: 5,
                        style: blackTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Fadli-kun',
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: regular),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '10/12/2022',
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: regular),
                      ),
                      Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/img_slider1.jpg'),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          lorem,
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
