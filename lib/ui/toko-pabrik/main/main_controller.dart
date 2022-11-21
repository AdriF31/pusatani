import 'package:flutter/material.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/ui/toko-pabrik/home/home_page.dart';
import 'package:pusatani/ui/toko-pabrik/profile/profile_page.dart';

class MainController extends BaseController {
  int currentIndex = 0;

  List<Widget> widgetOptions = [const HomePage(), const ProfilePage()];
  @override
  void onInit() {
    super.onInit();
    widgetOptions;
  }
}
