import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pusatani/reusable/back_button.dart';
import 'package:pusatani/ui/add-product/add_product_controller.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductController>(
        init: AddProductController(),
        builder: (c) => Scaffold(
              appBar: AppBar(
                title: Text('Tambah Produk'),
                leading: CustomBackButton(),
              ),
            ));
  }
}
