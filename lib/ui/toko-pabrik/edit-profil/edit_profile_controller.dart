import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/data/model/edit_profile_model.dart';
import 'package:pusatani/data/storage_core.dart';

import '../main/main_page.dart';

class EditProfileController extends BaseController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var lastNameController = TextEditingController();
  EditProfileModel? editProfileModel = EditProfileModel();
  int role = 1;
  RxBool isObscured = true.obs;
  var formKey = GlobalKey<FormState>();
  var value = 1;
  File? profilePicture;
  bool? isLoading = false;

  var storage = StorageCore();

  getProfilePicture() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File file = File(image.path);
      profilePicture = file;
      update();
    } else {
      // User canceled the picker
    }
  }

  updateProfile() async {
    isLoading = true;
    try {
      var response = await repository.postUpdateProfile(
        nameController.text,
        emailController.text,
        phoneController.text,
        profilePicture,
      );
      storage.saveObject('profile_pict', profilePicture?.path ?? '');
      print('PP: ${storage.getObject('profile_pict')}');
      isLoading = false;
      Fluttertoast.showToast(msg: response?.meta?.message ?? '');
      if (response?.meta?.code == 202) {
        Get.offAll(
          () => const MainPage(),
        );
      }
      update();
    } catch (e) {
      return null;
    }
  }
}
