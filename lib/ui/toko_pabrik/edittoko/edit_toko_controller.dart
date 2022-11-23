import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/data/storage_core.dart';
import 'package:pusatani/ui/toko_pabrik/main/main_page.dart';

import '../../../data/model/user_model.dart';

class EditTokoController extends BaseController {
  var storeController = TextEditingController();
  UserModel? userModel = UserModel();
  var addressController = TextEditingController();
  var descController = TextEditingController();
  StorageCore storage = StorageCore();
  var formKey = GlobalKey<FormState>();
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

  updateToko() async {
    try {
      var response = await repository.postEditToko(
          storeController.text,
          addressController.text,
          descController.text,
          tokoImage,
          storage.getCurrentStoreId() ?? 0);
      getUser();
      if (response?.meta?.code == 202) {
        Get.offAll(() => MainPage());
      }
    } catch (e) {
      return null;
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
}
