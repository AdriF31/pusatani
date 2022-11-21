import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/data/model/user_model.dart';
import 'package:pusatani/data/storage_core.dart';

class AddStoreSuccessController extends BaseController {
  UserModel? userModel = UserModel();
  var storage = StorageCore();
  @override
  void onInit() {
    getUser();
    super.onInit();
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
