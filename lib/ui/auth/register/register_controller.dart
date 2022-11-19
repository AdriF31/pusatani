import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/data/storage_core.dart';
import 'package:pusatani/ui/auth/login/login_page.dart';
import 'package:pusatani/ui/toko-pabrik/home/home_page.dart';
import 'package:pusatani/ui/toko-pabrik/main/main_page.dart';
import 'package:pusatani/ui/toko-pabrik/pendaftaran/add_toko_page.dart';

class RegisterController extends BaseController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var lastNameController = TextEditingController();
  int role = 1;
  RxBool isObscured = true.obs;
  var formKey = GlobalKey<FormState>();
  var value = 1;
  File? profilePicture;
  File? idPicture;
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

  getIdPicture() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File file = File(image.path);
      idPicture = file;
      update();
    } else {
      // User canceled the picker
    }
  }

  // postBlog() async {
  //   var response = await repository.postArticle(
  //       titleController.text, contentController.text, gettedPhoto, token!);
  //   Fluttertoast.showToast(msg: response!.meta!.message!);
  //   if (response.meta?.code == 201) {
  //     Get.offAll(() => const HomePage());
  //   }
  // }

  register() async {
    var response = await repository.postRegister(
        profilePicture,
        emailController.text,
        nameController.text,
        role,
        idPicture,
        phoneController.text,
        passwordController.text);
    Fluttertoast.showToast(msg: response.meta!.message!);
    if (response.meta?.code == 201) {
      var login = await repository.postLogin(
          emailController.text, passwordController.text);
      print(login);
      storage.saveAuthResponse(login);
      if (role == 1) {
        Get.offAll(
            () => HomePage(
                  role: role,
                ),
            arguments: role);
      }
    }
  }
}
