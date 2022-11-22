import 'dart:async';

import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/data/storage_core.dart';
import 'package:pusatani/ui/auth/login/login_page.dart';
import 'package:pusatani/ui/onboarding/onboarding_page.dart';
import 'package:pusatani/ui/toko-pabrik/main/main_page.dart';

class SplashController extends BaseController {
  var storage = StorageCore();
  bool first = false;

  @override
  void onInit() {
    super.onInit();

    Timer(const Duration(seconds: 3), () {
      if (storage.getAccessToken() != 'token_not_loaded') {
        Get.offAll(() => MainPage());
      } else {
        Get.offAll(() => OnboardingPage());
      }
    });
  }
}
