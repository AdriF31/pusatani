import 'package:get/get.dart';
import 'package:pusatani/data/network_core.dart';
import 'package:pusatani/data/repository/repository.dart';

class BaseController extends GetxController {
  NetworkCore networkCore = Get.find<NetworkCore>();
  Repository repository = Get.find<Repository>();
}
