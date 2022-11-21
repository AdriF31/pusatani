import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/data/model/detail_pabrik_model.dart';
import 'package:pusatani/data/storage_core.dart';

import '../../../data/model/detail_toko_model.dart';

class HomeController extends BaseController {
  DetailTokoModel? detailTokoModel = DetailTokoModel();
  DetailPabrikModel detailPabrikModel = DetailPabrikModel();
  StorageCore storage = StorageCore();
  CurrencyTextInputFormatter formatter =
      CurrencyTextInputFormatter(decimalDigits: 0, locale: 'id', symbol: 'Rp ');
  var isLoading = false;

  @override
  void onInit() {
    getData();
    update();
    super.onInit();
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

  void deleteData(int id) async {
    try {
      var response = await repository.deleteProduct(id);
      if (response!.meta!.code == 202) {
        Fluttertoast.showToast(msg: 'data berhasil dihapus');
      }
    } catch (e) {
      return null;
    }
  }

}
