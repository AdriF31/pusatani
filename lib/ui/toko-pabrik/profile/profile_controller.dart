import 'package:get/get.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/data/model/logout_model.dart';
import 'package:pusatani/data/storage_core.dart';
import 'package:pusatani/ui/auth/login/login_page.dart';

class ProfileController extends BaseController {
  LogoutModel? logoutModel = LogoutModel();
  StorageCore storage = StorageCore();

  logout() async {
    var response = await repository.getLogout();
    logoutModel = response;
    storage.deleteAuthResponse();
    if (logoutModel?.meta?.code == 200) {
      Get.offAll(() => LoginPage());
    }
    update();
  }
}
