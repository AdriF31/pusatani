import 'package:carousel_slider/carousel_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/data/model/list_article_model.dart';
import 'package:pusatani/data/model/pabrik_model.dart';
import 'package:pusatani/data/model/toko_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PetaniHomeController extends BaseController {
  TokoModel? tokoModel = TokoModel();
  PabrikModel? pabrikModel = PabrikModel();
  ListArticleModel? listArticleModel = ListArticleModel();
  var currentIndex = 0;
  CarouselController carouselController = CarouselController();
  var isLoading = false;
  final PagingController<int, Data2> pagingController =
      PagingController(firstPageKey: 1);
  @override
  void onInit() {
    super.onInit();
    Future.wait([getToko(), getPabrik()]);
    pagingController.addPageRequestListener((pageKey) {
      fetchArticle(pageKey);
    });

    update();
  }

  Future<void> getToko() async {
    isLoading = true;
    try {
      var response = await repository.getToko();

      // var article = await repository.getListArticle();
      // listArticleModel = article;

      tokoModel = response;
      isLoading = false;
      update();
    } catch (e) {
      return null;
    }
  }

  Future<void> getPabrik() async {
    isLoading = true;
    try {
      var response = await repository.getPabrik();
      pabrikModel = response;
      isLoading = false;
      update();
    } catch (e) {
      return null;
    }
  }

  Future<void> fetchArticle(int page) async {
    try {
      var article = await repository.getPagedListArticle(page);
      // tailorModel = article;

      var isLastPage = page >= article!.data!.lastPage!;
      debugPrint("isLastPage $isLastPage, ${article.data?.lastPage!} $page}");
      if (isLastPage) {
        pagingController.appendLastPage(article.data!.data!);
      } else {
        final nextPageKey = page + 1;
        pagingController.appendPage(article.data!.data!, nextPageKey);
      }
      update();
    } on DioError catch (e) {
      debugPrint(e.response?.data.toString());
    }
  }
}
