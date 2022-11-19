import 'package:flutter/cupertino.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/data/model/list_article_model.dart';

class InfoTaniController extends BaseController {
  PageController pageController = PageController();
  ListArticleModel? listArticleModel = ListArticleModel();
  var isLoading = true;
  @override
  void onInit() {
    super.onInit();
    getArticle();
    update();
  }

  void getArticle() async {
    isLoading = false;
    try {
      var response = await repository.getListArticle();
      listArticleModel = response;
      isLoading = true;
      update();
    } catch (e) {
      return null;
    }
  }
}
