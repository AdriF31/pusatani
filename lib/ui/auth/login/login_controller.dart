// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/data/model/login_model.dart';
import 'package:pusatani/data/storage_core.dart';
import 'package:pusatani/ui/petani/home/petani_home_page.dart';
import 'package:pusatani/ui/toko-pabrik/main/main_page.dart';

class LoginController extends BaseController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  RxBool isObscured = true.obs;
  bool isLoading = false;
  var formKey = GlobalKey<FormState>();
  LoginModel? loginModel = LoginModel();
  var storage = StorageCore();
  @override
  void onInit() {
    super.onInit();
    emailController.text;
    passwordController.text;
  }

  void login() async {
    isLoading = true;
    try {
      var res = await repository.postLogin(
          emailController.text, passwordController.text);
      loginModel = res;
      if (loginModel?.meta?.code == 200) {
        storage.saveAuthResponse(res);

        isLoading = false;
        Fluttertoast.showToast(msg: res!.meta!.message!);
        update();
        if (loginModel?.data?.user?.roles?.first.id == 2) {
          Get.offAll(() => const MainPage(), arguments: 2);
        } else if (loginModel?.data?.user?.roles?.first.id == 3) {
          Get.offAll(() => const MainPage(), arguments: 3);
        }
      } else {
        Fluttertoast.showToast(msg: res!.meta!.message!);
      }
      update();
    } catch (e) {
      return null;
    }
  }
}
