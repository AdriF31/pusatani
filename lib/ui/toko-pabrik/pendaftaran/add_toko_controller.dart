import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/data/storage_core.dart';
import 'package:pusatani/ui/toko-pabrik/main/main_page.dart';

class AddTokoController extends BaseController {
  var storeController = TextEditingController();
  var addressController = TextEditingController();
  var descController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var storage = StorageCore();
  File? tokoImage;
  getIdPicture() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File file = File(image.path);
      tokoImage = file;
      update();
    } else {
      // User canceled the picker
    }
  }

  addToko() async {
    var response = await repository.postToko(storeController.text,
        addressController.text, descController.text, tokoImage);
    if (response!.meta!.code == 201) {
      Get.offAll(() => MainPage());
    }
  }
}
