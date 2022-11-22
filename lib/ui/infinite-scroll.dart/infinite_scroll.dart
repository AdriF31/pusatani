import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pusatani/ui/detail-artikel/detail_artikel_page.dart';
import 'package:pusatani/ui/infinite-scroll.dart/infinite_scroll_controller.dart';
import 'package:pusatani/data/model/list_article_model.dart';

import '../../reusable/article_card.dart';

class InfiniteScroll extends StatelessWidget {
  const InfiniteScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfiniteScrollController>(
        init: InfiniteScrollController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(title: Text('pagination')),
              body: PagedGridView<int, Data1>(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 120 / 150,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    mainAxisExtent: 400,
                    crossAxisCount: 2,
                  ),
                  padding: EdgeInsets.zero,
                  pagingController: controller.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Data1>(
                      firstPageProgressIndicatorBuilder: (context) =>
                          const Center(
                              child: CircularProgressIndicator(
                            color: Colors.deepOrange,
                          )),
                      newPageProgressIndicatorBuilder: (context) =>
                          const Center(
                            child: CircularProgressIndicator.adaptive(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.redAccent)),
                          ),
                      itemBuilder: (context, item, index) => GestureDetector(
                            onTap: () {
                              Get.to(() => DetailArtikelPage(), arguments: {
                                'title': controller.listArticleModel?.data
                                    ?.data?[index].author,
                                'image': controller
                                    .listArticleModel?.data?.data?[index].image,
                                'author': controller.listArticleModel?.data
                                    ?.data?[index].author,
                                'content': controller.listArticleModel?.data
                                    ?.data?[index].author,
                                'date': controller.listArticleModel?.data
                                    ?.data?[index].author,
                                'category': controller.listArticleModel?.data
                                    ?.data?[index].author,
                              });
                            },
                            child: ArticleCard(
                              image: controller
                                  .listArticleModel?.data?.data?[index].image,
                              title: controller
                                  .listArticleModel?.data?.data?[index].author,
                              date: controller.listArticleModel?.data
                                  ?.data?[index].createdAt!
                                  .split('T')
                                  .first,
                              description: controller
                                  .listArticleModel?.data?.data?[index].body,
                            ),
                          ))),
            ));
  }
}
