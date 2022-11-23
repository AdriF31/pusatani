import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/data/model/user_model.dart';
import 'package:pusatani/data/storage_core.dart';
import 'package:pusatani/ui/success/add_store_success_page.dart';
import 'package:pusatani/ui/toko_pabrik/main/main_page.dart';

class AddTokoController extends BaseController {
  var storeController = TextEditingController();
  UserModel? userModel = UserModel();
  var addressController = TextEditingController();
  var descController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var storage = StorageCore();
  File? tokoImage;

  // @override
  // void onInit() {
  //   super.onInit();
  //   getUser();
  // }

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

  Future getUser() async {
    try {
      var response = await repository.getUser(storage.getCurrentUserId()!);
      userModel = response;

      storage.saveUserResponse(userModel);

      update();
    } catch (e) {
      return null;
    }
  }

  addToko() async {
    try {
      if (storage.getCurrentRole() == 3) {
        var response = await repository.postToko(storeController.text,
            addressController.text, descController.text, tokoImage);
        getUser();
        if (response!.meta!.code == 201) {
          Get.offAll(() => const MainPage());
        }
      } else if (storage.getCurrentRole() == 2) {
        var response = await repository.postPabrik(storeController.text,
            addressController.text, descController.text, tokoImage);
        getUser();
        if (response!.meta!.code == 201) {
          Get.offAll(() => const MainPage());
        }
      }
    } catch (e) {}
  }
}
