import 'package:get/get.dart';
import 'package:pusatani/data/network_core.dart';
import 'package:pusatani/data/repository/repository.dart';
import 'package:pusatani/data/repository/repository_impl.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<NetworkCore>(NetworkCore());
    Get.put<Repository>(RepositoryImpl());

  }
}
