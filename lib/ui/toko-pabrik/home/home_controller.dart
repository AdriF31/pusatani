import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/data/model/detail_pabrik_model.dart';
import 'package:pusatani/data/model/user_model.dart';
import 'package:pusatani/data/storage_core.dart';

import '../../../data/model/detail_toko_model.dart';

class HomeController extends BaseController {
  DetailTokoModel? detailTokoModel = DetailTokoModel();
  DetailPabrikModel detailPabrikModel = DetailPabrikModel();
  UserModel? userModel = UserModel();
  StorageCore storage = StorageCore();
  CurrencyTextInputFormatter formatter =
      CurrencyTextInputFormatter(decimalDigits: 0, locale: 'id', symbol: 'Rp ');
  var isLoading = false;

  @override
  void onInit() {
    getData();
    storage.getCurrentPabrikIdFromUser();
    storage.getCurrentStoreIdFromUser();
    update();
    super.onInit();
  }

  Future getData() async {
    isLoading = true;
    try {
      if (storage.getCurrentRole() == 2) {
        var response = await repository
            .getDetailPabrik(storage.getCurrentPabrikIdFromUser()!);
        detailPabrikModel = response;
        isLoading = false;
        update();
      } else if (storage.getCurrentRole() == 3) {
        var response = await repository
            .getDetailToko(storage.getCurrentStoreIdFromUser()!);
        detailTokoModel = response;
        isLoading = false;
        update();
      }
    } catch (e) {
      return null;
    }
  }

  deleteData(int id) async {
    try {
      if (storage.getCurrentRole() == 3) {
        var response = await repository.deleteProduct(id);
        getData();
        if (response!.meta!.code == 202) {
          Fluttertoast.showToast(msg: 'data berhasil dihapus');
        }
      } else if (storage.getCurrentRole() == 2) {
        var response = await repository.deleteGabah(id);
        getData();
        if (response!.meta!.code == 202) {
          Fluttertoast.showToast(msg: 'data berhasil dihapus');
        }
      }
    } catch (e) {
      return null;
    }
  }
}
