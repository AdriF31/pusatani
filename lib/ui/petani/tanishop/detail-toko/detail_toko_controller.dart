import 'package:get/get.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/data/model/detail_toko_model.dart';

class DetailTokoController extends BaseController {
  DetailTokoModel? detailTokoModel = DetailTokoModel();
  bool isLoading = false;
  @override
  void onInit() {
    getDetail();
    super.onInit();
  }

  void getDetail() async {
    isLoading = true;
    try {
      var response = await repository.getDetailToko(Get.arguments);
      print(Get.arguments);
      detailTokoModel = response;
      print(detailTokoModel?.data?.tokoToProduk?.first.name);
      isLoading = false;
      update();
    } catch (e) {
      return null;
    }
  }
}
