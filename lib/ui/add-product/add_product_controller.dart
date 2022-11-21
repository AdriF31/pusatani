import 'dart:io';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/data/model/add_product_model.dart';
import 'package:pusatani/data/storage_core.dart';
import 'package:pusatani/ui/toko-pabrik/main/main_page.dart';

import '../../data/model/add_gabah_model.dart';

class AddProductController extends BaseController {
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

  addProduct() async {
    try {
      var response = await repository.postProduk(
          nameController.text,
          descriptionController.text,
          formatter.getUnformattedValue().toInt(),
          stok,
          productImage);
      if (response?.meta?.code == 201) {
        Fluttertoast.showToast(msg: 'Produk berhasil ditambahkan');
        Get.offAll(() => MainPage());
      }
    } catch (e) {
      return null;
    }
  }

  addGabah() async {
    try {
      var response = await repository.postGabah(
          nameController.text,
          descriptionController.text,
          formatter.getUnformattedValue().toInt(),
          productImage);
      if (response?.meta?.code == 201) {
        Fluttertoast.showToast(msg: 'Produk berhasil ditambahkan');

        Get.offAll(() => MainPage());
      }
    } catch (e) {
      return null;
    }
  }
}
