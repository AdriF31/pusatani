import 'dart:io';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/data/model/detail_pabrik_model.dart';
import 'package:pusatani/data/storage_core.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPabrikController extends BaseController {
  DetailPabrikModel detailPabrikModel = DetailPabrikModel();
  CurrencyTextInputFormatter formatter =
      CurrencyTextInputFormatter(decimalDigits: 0, locale: 'id', symbol: 'Rp ');
  bool isLoading = false;
  StorageCore storage = StorageCore();
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

  whatsapp() async {
    var contact = "+6282319858335";
    var androidUrl =
        "whatsapp://send?phone=${storage.getCurrentPhoneNumber()}&text=Hi, I need some help";
    var iosUrl =
        "https://wa.me/${storage.getCurrentPhoneNumber()}?text=${Uri.parse('Permisi, saya ingin menjual gabah saya')}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: 'WhatsApp is not installed.');
    }
  }
}
