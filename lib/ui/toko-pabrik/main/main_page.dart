import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pusatani/const/colors.dart';
import 'package:pusatani/ui/add-product/add_product_page.dart';
import 'package:pusatani/ui/toko-pabrik/main/main_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
        init: MainController(),
        builder: (c) {
          return Scaffold(
            body: Center(
              child: c.widgetOptions.elementAt(c.currentIndex),
            ),
            floatingActionButton: SizedBox(
              height: 70,
              width: 70,
              child: FloatingActionButton(
                  onPressed: () {
                    Get.to(() => const AddProductPage());
                  },
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/images/ic_add_product.png',
                    width: 32,
                  )),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: CustomLineIndicatorBottomNavbar(
              selectedColor: primaryColor,
              unSelectedColor: Colors.grey,
              backgroundColor: Colors.white,
              currentIndex: c.currentIndex,
              onTap: (index) {
                c.currentIndex = index;
                c.update();
              },
              enableLineIndicator: true,
              lineIndicatorWidth: 3,
              indicatorType: IndicatorType.Top,
              customBottomBarItems: [
                CustomBottomBarItems(
                  label: 'Beranda',
                  icon: Icons.home,
                ),
                CustomBottomBarItems(
                  label: 'Profil',
                  icon: Icons.person,
                ),
              ],
            ),
          );
        });
  }
}
