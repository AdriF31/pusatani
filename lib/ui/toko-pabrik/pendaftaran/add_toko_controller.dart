import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pusatani/base/base_controller.dart';

class AddTokoController extends BaseController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var lastNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  File? tokoImage;
  getIdPicture() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File file = File(image.path);
      tokoImage = file;
      update();
    } else {
      // User canceled the picker
    }
  }
}
