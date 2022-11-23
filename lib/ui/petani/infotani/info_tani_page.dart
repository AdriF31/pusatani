import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pusatani/data/model/list_article_model.dart';
import 'package:pusatani/reusable/article_card.dart';
import 'package:pusatani/reusable/back_button.dart';
import 'package:pusatani/ui/detail_artikel/detail_artikel_page.dart';
import 'package:pusatani/ui/petani/infotani/info_tani_controller.dart';

import '../../../const/colors.dart';
import '../../../const/font_weight.dart';

class InfoTaniPage extends StatefulWidget {
  const InfoTaniPage({Key? key}) : super(key: key);

  @override
  State<InfoTaniPage> createState() => _InfoTaniPageState();
}

class _InfoTaniPageState extends State<InfoTaniPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoTaniController>(
        init: InfoTaniController(),
        builder: (c) {
          return c.isLoading
              ? Scaffold(
                  appBar: AppBar(
                      leading: const CustomBackButton(),
                      title: const Text('Info Tani')),
                  body: Column(
                    children: [
                      SafeArea(
                          child: Container(
                        height: 10,
                      )),
                      ButtonsTabBar(
                        controller: tabController,
                        backgroundColor: primaryColor,
                        borderColor: secondaryColor,
                        height: 60,
                        unselectedBackgroundColor: Colors.transparent,
                        labelStyle: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        borderWidth: 1,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        unselectedBorderColor: primaryColor,
                        tabs: const [
                          Tab(
                            text: 'Semua',
                          ),
                          Tab(
                            text: 'Berita',
                          ),
                          Tab(
                            text: "Teknologi",
                          ),
                          Tab(
                            text: "Pertanian",
                          ),
                          Tab(
                            text: "Hama dan Penyakit",
                          ),
                        ],
                      ),
                      Expanded(
                          child: TabBarView(
                        controller: tabController,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: c.listArticleModel!.data!
                                    .map(
                                      (e) => GestureDetector(
                                        onTap: () => Get.to(
                                            () => DetailArtikelPage(),
                                            arguments: {
                                              'title': e.title,
                                              'image': e.image,
                                              'author': e.author,
                                              'content': e.body,
                                              'date': e.createdAt,
                                              'category': e.idCategory
                                            }),
                                        child: ArticleCard(
                                            image: e.image ?? '',
                                            title: e.title ?? '',
                                            date: DateTime.parse(
                                                e.createdAt ?? ''),
                                            description: e.body ?? ''),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: c.listArticleModel!.data!
                                    .where(
                                        (element) => element.idCategory == 12)
                                    .map(
                                      (e) => GestureDetector(
                                        onTap: () => Get.to(
                                            () => DetailArtikelPage(),
                                            arguments: {
                                              'title': e.title,
                                              'image': e.image,
                                              'author': e.author,
                                              'content': e.body,
                                              'date': e.createdAt,
                                              'category': e.idCategory
                                            }),
                                        child: ArticleCard(
                                            image: e.image ?? '',
                                            title: e.title ?? '',
                                            date: DateTime.parse(
                                                e.createdAt ?? ''),
                                            description: e.body ?? ''),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: c.listArticleModel!.data!
                                    .where(
                                        (element) => element.idCategory == 13)
                                    .map(
                                      (e) => GestureDetector(
                                        onTap: () => Get.to(
                                            () => DetailArtikelPage(),
                                            arguments: {
                                              'title': e.title,
                                              'image': e.image,
                                              'author': e.author,
                                              'content': e.body,
                                              'date': e.createdAt,
                                              'category': e.idCategory
                                            }),
                                        child: ArticleCard(
                                            image: e.image ?? '',
                                            title: e.title ?? '',
                                            date: DateTime.parse(
                                                e.createdAt ?? ''),
                                            description: e.body ?? ''),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: c.listArticleModel!.data!
                                    .where(
                                        (element) => element.idCategory == 14)
                                    .map(
                                      (e) => ArticleCard(
                                          image: e.image ?? '',
                                          title: e.title ?? '',
                                          date:
                                              DateTime.parse(e.createdAt ?? ''),
                                          description: e.body ?? ''),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                children: c.listArticleModel!.data!
                                    .where(
                                        (element) => element.idCategory == 15)
                                    .map(
                                      (e) => GestureDetector(
                                        onTap: () => Get.to(
                                            () => DetailArtikelPage(),
                                            arguments: {
                                              'title': e.title,
                                              'image': e.image,
                                              'author': e.author,
                                              'content': e.body,
                                              'date': e.createdAt,
                                              'category': e.idCategory
                                            }),
                                        child: ArticleCard(
                                            image: e.image ?? '',
                                            title: e.title ?? '',
                                            date: DateTime.parse(
                                                e.createdAt ?? ''),
                                            description: e.body ?? ''),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ))
                    ],
                  ))
              : const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
        });
  }
}
