import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pusatani/ui/success/add_store_success_controlller.dart';
import 'package:pusatani/ui/toko-pabrik/main/main_page.dart';

class AddStoreSuccessPage extends StatelessWidget {
  const AddStoreSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddStoreSuccessController>(
        builder: (c) => Scaffold(
              body: Center(
                  child: Column(
                children: [
                  GestureDetector(
                      onTap: () => Get.offAll(MainPage()),
                      child: Text('toko berhasil dibuat'))
                ],
              )),
            ));
  }
}
