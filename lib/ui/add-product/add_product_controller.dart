import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pusatani/base/base_controller.dart';

class AddProductController extends BaseController {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descriptionController = TextEditingController();

  var value = 1;
  var stok = "Tersedia";
  File? productImage;
  getProductPicture() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File file = File(image.path);
      productImage = file;
      update();
    } else {
      // User canceled the picker
    }
  }
}
