import 'dart:async';

import 'package:get/get.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/ui/auth/login/login_page.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () => Get.offAll(() => const LoginPage()));
  }
}
