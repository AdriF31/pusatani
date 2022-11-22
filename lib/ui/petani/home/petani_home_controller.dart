import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/data/model/list_article_model.dart';
import 'package:pusatani/data/model/pabrik_model.dart';
import 'package:pusatani/data/model/toko_model.dart';

class PetaniHomeController extends BaseController {
  TokoModel? tokoModel = TokoModel();
  PabrikModel? pabrikModel = PabrikModel();
  ListArticleModel? listArticleModel = ListArticleModel();
  var currentIndex = 0;
  CarouselController carouselController = CarouselController();
  var isLoading = false;
  @override
  void onInit() {
    super.onInit();
    getToko();
    // getPabrik();
    update();
  }

  void getToko() async {
    isLoading = true;
    try {
      var response = await repository.getToko();
      var response2 = await repository.getPabrik();
      var article = await repository.getListArticle(1);
      listArticleModel = article;
      pabrikModel = response2;
      tokoModel = response;
      isLoading = false;
      update();
    } catch (e) {
      return null;
    }
  }

  void getPabrik() async {
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
}
