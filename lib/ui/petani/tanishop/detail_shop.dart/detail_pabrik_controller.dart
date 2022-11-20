import 'package:get/get.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/data/model/detail_pabrik_model.dart';

class DetailPabrikController extends BaseController {
  DetailPabrikModel detailPabrikModel = DetailPabrikModel();
  bool isLoading = false;
  @override
  void onInit() {
    getDetail();
    super.onInit();
  }

  void getDetail() async {
    isLoading = true;
    try {
      var response = await repository.getDetailPabrik(Get.arguments);
      print(Get.arguments);
      detailPabrikModel = response;
      isLoading = false;
      update();
    } catch (e) {
      return null;
    }
  }
}
