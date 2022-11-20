import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/data/model/detail_pabrik_model.dart';
import 'package:pusatani/data/model/pabrik_model.dart';
import 'package:pusatani/data/model/toko_model.dart';
import 'package:pusatani/data/storage_core.dart';

import '../../../data/model/detail_toko_model.dart';

class HomeController extends BaseController {
  DetailTokoModel? detailTokoModel = DetailTokoModel();
  DetailPabrikModel detailPabrikModel = DetailPabrikModel();
  StorageCore storage = StorageCore();
  var isLoading = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  void getData() async {
    isLoading = true;
    if (storage.getCurrentRole() == 2) {
      var response =
          await repository.getDetailPabrik(storage.getCurrentPabrikId()!);
      detailPabrikModel = response;
      isLoading = false;
      print(storage.getCurrentStoreId());
      update();
    } else if (storage.getCurrentRole() == 3) {
      var response =
          await repository.getDetailToko(storage.getCurrentStoreId()!);
      detailTokoModel = response;
      isLoading = false;
      update();
    }
  }
}
