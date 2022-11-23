import 'package:carousel_slider/carousel_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
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
  DateFormat formatter = DateFormat('yyyy-MM-ddTHH:mm:ss.000000Z');
  DateFormat dateFormat = DateFormat('dd MMMM yyyy', 'id');
  var isLoading = false;
  // final PagingController<int, Data2> pagingController =
  //     PagingController(firstPageKey: 1);
  @override
  void onInit() {
    // Future.wait([getToko(), getPabrik(), getArticle()]);
    getToko();
    // pagingController.addPageRequestListener((pageKey) {
    //   fetchArticle(pageKey);
    // });

    update();
    super.onInit();
  }

  Future<void> getToko() async {
    isLoading = true;
    try {
      var toko = await repository.getToko();
      var pabrik = await repository.getPabrik();
      var article = await repository.getListArticle();
      pabrikModel = pabrik;
      // var article = await repository.getListArticle();
      listArticleModel = article;

      tokoModel = toko;
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

  Future<void> getArticle() async {
    isLoading = true;
    try {
      var response = await repository.getListArticle();
      listArticleModel = response;
      isLoading = false;
      update();
    } catch (e) {
      return null;
    }
  }
  // Future<void> fetchArticle(int page) async {
  //   try {
  //     var article = await repository.getPagedListArticle(page);
  //     // tailorModel = article;

  //     var isLastPage = page == article!.data!.lastPage!;
  //     debugPrint("isLastPage $isLastPage, ${article.data?.lastPage!}>= $page}");
  //     if (isLastPage) {
  //       pagingController.appendLastPage(article.data!.data!);
  //     } else {
  //       final nextPageKey = page + 1;
  //       pagingController.appendPage(article.data!.data!, nextPageKey);
  //     }
  //     update();
  //   } on DioError catch (e) {
  //     debugPrint(e.response?.data.toString());
  //   }
  // }
}
