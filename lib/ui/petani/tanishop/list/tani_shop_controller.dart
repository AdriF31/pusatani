import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/data/model/toko_model.dart';

import '../../../../data/model/list_article_model.dart';
import '../../../../data/model/pabrik_model.dart';

class TaniShopController extends BaseController {
  TokoModel? tokoModel = TokoModel();
  PabrikModel? pabrikModel = PabrikModel();
  var currentIndex = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  CarouselController carouselController = CarouselController();
  var isLoading = false;
  void getData() async {
    isLoading = true;
    try {
      var toko = await repository.getToko();
      var pabrik = await repository.getPabrik();

      pabrikModel = pabrik;
      tokoModel = toko;
      isLoading = false;
      update();
    } catch (e) {
      return null;
    }
  }
}
