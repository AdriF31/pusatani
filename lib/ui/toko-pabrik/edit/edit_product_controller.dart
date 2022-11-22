import 'dart:io';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/ui/toko-pabrik/main/main_page.dart';

import '../../../data/storage_core.dart';

class EditProductController extends BaseController {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descriptionController = TextEditingController();
  StorageCore storage = StorageCore();
  CurrencyTextInputFormatter formatter =
      CurrencyTextInputFormatter(decimalDigits: 0, locale: 'id', symbol: 'Rp ');

  var value = 1;
  var stok = "Tersedia";
  File? productImage;
  getProductPicture() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File file = File(image.path);
      productImage = file;
      update();
    } else {
      // User canceled the picker
    }
  }

  void updateProduct(int id) async {
    try {
      if (storage.getCurrentRole() == 3) {
        var response = await repository.postEditProduk(
            nameController.text,
            descriptionController.text,
            formatter.getUnformattedValue().toInt(),
            stok,
            productImage,
            id);
        if (response?.meta?.code == 202) {
          Fluttertoast.showToast(msg: 'Data produk berhasil diubah');
          Get.offAll(() => const MainPage());
        }
      } else if (storage.getCurrentRole() == 2) {
        var response = await repository.postEditGabah(
            nameController.text,
            descriptionController.text,
            formatter.getUnformattedValue().toInt(),
            productImage,
            id);
        if (response?.meta?.code == 202) {
          Fluttertoast.showToast(msg: 'Data gabah berhasil diubah');
          Get.offAll(() => const MainPage());
        }
      }
    } catch (e) {
      return null;
    }
  }
}
